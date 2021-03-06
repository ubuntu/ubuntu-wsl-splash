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

import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

import 'app_home.dart';
import 'installer_state_controller.dart';
import 'l10n/app_localizations.dart';
import 'slide.dart';
import 'stdin_stream.dart';
import 'utils/win32utils.dart';

void main() {
  runApp(const UbuntuWslSplash());
}

class UbuntuWslSplash extends StatelessWidget {
  const UbuntuWslSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) {
        final lang = AppLocalizations.of(context);
        setWindowTitle(lang.windowTitle);
        return lang.appTitle;
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: yaruLight,
      darkTheme: yaruDark,
      home: Builder(builder: (context) {
        return AppHome(
          controller: InstallerStateController(
            stdinStream(),
            InstallerState.initializing,
          ),
          slides: theSlides(context),
        );
      }),
    );
  }
}
