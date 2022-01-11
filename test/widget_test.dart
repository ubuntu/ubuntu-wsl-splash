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

import 'package:flutter_test/flutter_test.dart';

import 'package:ubuntu_wsl_splash/main.dart';

void main() {
  testWidgets('Dummy test to started the project', (WidgetTester tester) async {
    // TODO: Replace this with serious tests.
    await tester.pumpWidget(const UbuntuWslSplash());

    expect(find.text('Hello, World!'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}
