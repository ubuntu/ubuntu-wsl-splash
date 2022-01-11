import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

void setWindowTitle(String title) {
  final hWnd =
      FindWindow('FLUTTER_RUNNER_WIN32_WINDOW'.toNativeUtf16(), nullptr);
  final titleNative = title.toNativeUtf16();
  SetWindowText(hWnd, titleNative);
}
