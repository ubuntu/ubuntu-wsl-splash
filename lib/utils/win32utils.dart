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

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

void setWindowTitle(String title) {
  final hWnd =
      FindWindow('FLUTTER_RUNNER_WIN32_WINDOW'.toNativeUtf16(), nullptr);
  final titleNative = title.toNativeUtf16();
  SetWindowText(hWnd, titleNative);
}
