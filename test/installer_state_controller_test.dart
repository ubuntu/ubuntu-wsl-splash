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

import 'package:test/test.dart';
import 'package:ubuntu_wsl_splash/installer_state_controller.dart';

void main() {
  group('Intallation status controller tests', () {
    test("Should emit only states upon reacting to the input stream", () {
      InstallerStateController controller = InstallerStateController(
        const Stream.empty(),
        InstallerState.kInitializing,
      );

      expect(controller.states, neverEmits(isA<InstallerState>()));
    });
    test("Should not trigger any state transition from unkown messages", () {
      // Given:
      const stdoutMessages = [
        "Parsing... success!",
        "flutter: INFO ubuntu_wsl_setup: Logging to /var/log/installer/ubuntu_wsl_setup.log",
        "flutter: ERROR ubuntu_wsl_setup: FontConfig cannot find default files",
      ];

      InstallerStateController controller = InstallerStateController(
        Stream.fromIterable(stdoutMessages),
        InstallerState.kInitializing,
      );

      // When:
      // empty because this controller is meant to react upon the stream of
      // inputs, istead of acting in a controlled call fashion.

      // Then:
      expect(controller.states, neverEmits(isA<InstallerState>()));
    });
    test("Should transition states only from unkown messages", () {
      // Given:
      const stdoutMessages = [
        "Installing, this may take a few minutes...",
        "Installation successful!",
        "Launching the OOBE",
        "flutter: INFO ubuntu_wsl_setup: Logging to /var/log/installer/ubuntu_wsl_setup.log",
        "flutter: ERROR ubuntu_wsl_setup: FontConfig cannot find default files",
        "Error: OOBE not found.",
      ];

      InstallerStateController controller = InstallerStateController(
        Stream.fromIterable(stdoutMessages),
        InstallerState.kInitializing,
      );

      // When:

      // Then:
      expect(
        controller.states,
        emitsInOrder(
          [
            InstallerState.kUnpacking,
            InstallerState.kSettingUp,
            InstallerState.kRunning,
            InstallerState.kError,
            emitsDone,
          ],
        ),
      );
    });
  });
}
