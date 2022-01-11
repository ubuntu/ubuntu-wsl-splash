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
 * Shamelessly copied from github.com/jpnurmi/ubuntu-desktop-installer
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wsl_splash/widgets/log_view.dart';

void main() {
  testWidgets('append lines', (tester) async {
    final log = StreamController<String>(sync: true);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LogView(log: log.stream, maxLines: 2),
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));

    final controller = textField.controller;
    expect(controller, isNotNull);

    final scrollController = textField.scrollController;
    expect(scrollController, isNotNull);

    log.add('line 1');
    await tester.pump();
    expect(controller!.text, equals('line 1'));
    expect(scrollController!.position.extentAfter, equals(0.0));
    expect(scrollController.position.maxScrollExtent, equals(0.0));

    log.add('line 2');
    await tester.pump();
    expect(controller.text, equals('line 1\nline 2'));
    expect(scrollController.position.extentAfter, equals(0.0));
    expect(scrollController.position.maxScrollExtent, equals(0.0));

    log.add('line 3');
    await tester.pump();
    expect(controller.text, equals('line 1\nline 2\nline 3'));
    expect(scrollController.position.extentAfter, equals(0.0));
    expect(scrollController.position.maxScrollExtent, greaterThan(0.0));
  });
}
