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

import 'dart:async';
import 'dart:io';

/// During tests under a real Windows box installing WSL and redirecting the
/// stdout to the Flutter app, it was noticed that sometimes the Flutter app
/// received the data broken after the first character as if a new line was
///inserted. For instance:
/// ```cpp
/// wprintf("Installing");
///```
/// would render in Flutter:
///```text
///I
///nstalling
///```
/// That phenomenum was consistent enough to motivate a workaround.
/// Although the root cause was not yet discovered, to avoid blocking on that
/// research the stateful stream transformer below was developed as a workaround.
class StdinTransformer implements StreamTransformer<List<int>, String> {
  /// The length at which the stdin was observed as broken.
  static const kBrokenStreamLength = 1;
  late StreamController<String> _controller;
  late StreamSubscription<String> _subscription;
  bool cancelOnError;
  late Stream<List<int>> _stream;
  String _lastBrokenInput = '';

  StdinTransformer({bool sync = false, this.cancelOnError = true}) {
    _controller = StreamController<String>(
        onListen: _onListen,
        onCancel: _onCancel,
        onPause: () {
          _subscription.pause();
        },
        onResume: () {
          _subscription.resume();
        },
        sync: sync);
  }

  StdinTransformer.broadcast({bool sync = false, this.cancelOnError = true}) {
    _controller = StreamController<String>.broadcast(
        onListen: _onListen, onCancel: _onCancel, sync: sync);
  }

  void _onListen() {
    _subscription = _stream.transform(systemEncoding.decoder).listen(onData,
        onError: _controller.addError,
        onDone: _controller.close,
        cancelOnError: cancelOnError);
  }

  void _onCancel() {
    _subscription.cancel();
  }

  void onData(String data) {
    if (data.length == kBrokenStreamLength) {
      _lastBrokenInput = data;
    } else {
      _controller.add(_lastBrokenInput + data);
      _lastBrokenInput = '';
    }
  }

  @override
  Stream<String> bind(Stream<List<int>> stream) {
    _stream = stream;
    return _controller.stream;
  }

  @override
  StreamTransformer<RS, RT> cast<RS, RT>() {
    return StreamTransformer.castFrom(this);
  }
}
