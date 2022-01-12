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
