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

enum InstallerState { initializing, unpacking, settingUp, running, done, error }

/// Models the WSL launcher app state change as a function of the input String.
/// This line is meant to come from a transformation of [stdin], thus instead
/// of calls to `add()` an event, as regular BLoC does, this controller accepts
/// a [inputStream] in its constructor as a source of events and wraps it with
/// an internal [StreamController].
class InstallerStateController {
  late final StreamController<String> _eventsController;
  late final StreamController<InstallerState> _stateController;
  late final StreamSubscription<String> _eventSubs;
  InstallerState _state;
  InstallerState get state => _state;
  Stream<InstallerState> get states => _stateController.stream;
  Stream<String> get journal => _eventsController.stream;

  InstallerStateController(
    Stream<String> inputStream,
    InstallerState initialState,
  ) : _state = initialState {
    _eventsController = StreamController<String>.broadcast();
    _stateController = StreamController<InstallerState>.broadcast();
    _eventsController.addStream(inputStream).then((_) => dispose());
    _eventSubs = _eventsController.stream.listen(processJournalInput);
    _stateController.add(initialState);
  }

  // First pass: REGEX.
  // TODO: Augment the state transition as they become more explicit in the
  // launcher C++ application.
  final Map<RegExp, InstallerState> _patternsToStates = {
    RegExp("Installing, this may take a few minutes.*"):
        InstallerState.unpacking,
    RegExp(".*Error:.*"): InstallerState.error,
    RegExp("^Installation successful!\$"): InstallerState.settingUp,
    RegExp("^Unpacking is complete!\$"): InstallerState.settingUp,
    RegExp("Launching .*"): InstallerState.running,
  };

  void processJournalInput(String line) {
    for (var entry in _patternsToStates.entries) {
      if (entry.key.hasMatch(line)) {
        _state = entry.value;
        _stateController.add(_state);
        break; // stop on the first match.
      }
    }
  }

  void dispose() {
    _eventSubs.cancel();
    if (!_stateController.isClosed) {
      _stateController.close();
    }
    if (!_eventsController.isClosed) {
      _eventsController.close();
    }
  }
}
