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
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wsl_splash/installer_status_widget.dart';

void main() {
  testWidgets("Installer status should keep LogView state when collapsed",
      (WidgetTester tester) async {
    const contents = ["Line 1", "Line 2", "Line 3", "Lines 4"];
    final joined = contents.join('\n');
    final log = Stream.fromIterable(contents);
    final status = InstallerStatus(
        title: const Text("Title"),
        statusIcon: const Icon(Icons.ac_unit),
        log: log,
        maxLines: 4);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: status,
        ),
      ),
    );

    final tile = find.text("Title");
    await tester.tap(tile);
    await tester.pumpAndSettle();

    expect(find.text(joined), findsWidgets);

    await tester.tap(tile);
    await tester.pumpAndSettle();
    expect(find.text(joined), findsNothing);

    await tester.tap(tile);
    await tester.pumpAndSettle();
    expect(find.text(joined), findsWidgets);
  });
}
