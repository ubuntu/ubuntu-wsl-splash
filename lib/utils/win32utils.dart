/*
 * Copyright (C) 2022 Canonical Ltd
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

import 'package:ffi/ffi.dart';
import 'package:flutter/services.dart';
import 'package:win32/win32.dart';

void setWindowTitle(String title) {
  final windowClass = 'FLUTTER_RUNNER_WIN32_WINDOW'.toNativeUtf16();
  final windowName = 'ubuntu_wsl_splash'.toNativeUtf16();
  final hWnd = FindWindow(windowClass, windowName);
  final titleNative = title.toNativeUtf16();
  SetWindowText(hWnd, titleNative);
  malloc.free(windowClass);
  malloc.free(windowName);
  malloc.free(titleNative);
}

/// A class that helps your Flutter desktop app to handle window close event.
/// Heavily inspired by package:flutter_window_close.
/// Having it integrated into the app instead of being a plugin gives direct
/// access to the window handle, thus there is no possibility of failure if the
/// call to GetActiveWindow() fails due users interacting with other windows
/// at the moment of the call.
class SplashWindowCloseNotifier {
  SplashWindowCloseNotifier._();

  static Future<bool> Function()? _onCloseEventHandler;
  static Future<bool> Function()? _onCustomCloseEventHandler;
  static MethodChannel? _notificationChannel;
  static const MethodChannel _channel = MethodChannel('splash_window_close');

  /// Sets a function to handle window close events.
  ///
  /// When a user click on the close button on a window, the method channel
  /// redirects the event to your function. The function should return a future
  /// that returns a boolean indicating whether the user really wants to
  /// close the window or not. True will let the window to be closed, while
  /// false let the window to remain open.
  ///
  /// By default there is no handler, and the window will be directly closed
  /// when a window close event happens. You can also reset the handler by
  /// passing null to the method.
  ///
  /// Besides WM_CLOSE, its possible to react to WM_USER+7 code through the
  /// [onCustomClose] callback. It shares the same phylosophy of [onClose]
  /// but it's less strict, i.e., does nothing it the parameter is null.
  /// For the usage in WSL, though, [onCustomClose] is even more important
  /// because that's the message the launcher will issue.
  ///
  /// Example:
  ///
  /// ``` dart
  /// SplashWindowClose.setWindowCloseHandler(onClose: () async {
  ///     return await showDialog(
  ///         context: context,
  ///         builder: (context) {
  ///           return AlertDialog(
  ///           title: const Text('Do you really want to quit?'),
  ///           actions: [
  ///             ElevatedButton(
  ///             onPressed: () => Navigator.of(context).pop(true),
  ///             child: const Text('Yes')),
  ///             ElevatedButton(
  ///             onPressed: () => Navigator.of(context).pop(false),
  ///             child: const Text('No')),
  ///           ]);
  ///         }).timeout(const Duration(seconds: 5), onTimeout: ()=>true);
  /// });
  /// ```
  static void setWindowCloseHandler(
      {Future<bool> Function()? onClose,
      Future<bool> Function()? onCustomClose}) {
    _onCloseEventHandler = onClose;
    _onCustomCloseEventHandler = onCustomClose;
    if (_notificationChannel == null) {
      var channel = const MethodChannel('splash_window_close_notification');
      channel.setMethodCallHandler((call) async {
        if (call.method == 'onCustomCloseEvent') {
          final handler = SplashWindowCloseNotifier._onCustomCloseEventHandler;
          if (handler != null) {
            final result = await handler();
            if (result) SplashWindowCloseNotifier.terminateWindow();
          }
        }

        if (call.method == 'onWindowClose') {
          final handler = SplashWindowCloseNotifier._onCloseEventHandler;
          if (handler != null) {
            final result = await handler();
            if (result) SplashWindowCloseNotifier.terminateWindow();
          } else {
            _channel.invokeMethod('quitWindow');
          }
        }
        return null;
      });
      _notificationChannel = channel;
    }
  }

  static void closeWindow() {
    _channel.invokeMethod('closeWindow');
  }

  static void terminateWindow() {
    _channel.invokeMethod('destroyWindow');
  }
}
