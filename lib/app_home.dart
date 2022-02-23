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
import 'package:yaru_icons/yaru_icons.dart';

import 'constants.dart';
import 'installer_state_controller.dart';
import 'installer_status_widget.dart';
import 'l10n/app_localizations.dart';
import 'slide.dart';
import 'slides_page.dart';
import 'utils/win32utils.dart';

class AppHome extends StatefulWidget {
  const AppHome({
    Key? key,
    required this.slides,
    required this.controller,
  }) : super(key: key);

  final List<Slide> slides;
  final InstallerStateController controller;

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  Future<bool?> _showExitDialog() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          final lang = AppLocalizations.of(context);
          return AlertDialog(
              title: Text(lang.exitTitle),
              content: Text(lang.exitContents),
              actions: [
                OutlinedButton(
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop(true),
                  child: const Text("Leave"),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("Cancel"),
                ),
              ]);
        });
  }

  Future<bool?> _showCustomExitDialog() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          final lang = AppLocalizations.of(context);
          return AlertDialog(
              title: Text(lang.customExitTitle),
              content: Text(lang.customExitContents),
              actions: [
                ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context, rootNavigator: true).pop(true),
                    child: Text(lang.ok)),
              ]);
        }).timeout(const Duration(seconds: 7), onTimeout: () => true);
  }

  @override
  void initState() {
    super.initState();
    SplashWindowCloseNotifier.setWindowCloseHandler(
      onClose: _showExitDialog,
      onCustomClose: _showCustomExitDialog,
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidesPage(
      widget.slides,
      bottom: StreamBuilder<InstallerState>(
        stream: widget.controller.states,
        builder: (context, snapshot) {
          return _buildStatusTile(
            context,
            snapshot.data,
            widget.controller.journal,
          );
        },
      ),
    );
  }

// The core of the whole application state.
  Widget _buildStatusTile(
    BuildContext context,
    InstallerState? state,
    Stream<String> log,
  ) {
    late final Widget statusIcon, title;
    Widget? subtitle;
    final lang = AppLocalizations.of(context);
    final errorColor = Theme.of(context).errorColor;

    switch (state) {
      case null:
      case InstallerState.initializing:
        statusIcon = const SizedBox(
          child: CircularProgressIndicator(),
          height: kSpanElementSize,
          width: kSpanElementSize,
        );
        title = const Text("Initializing...");
        break;

      case InstallerState.unpacking:
        statusIcon = const SizedBox(
          child: CircularProgressIndicator(),
          height: kSpanElementSize,
          width: kSpanElementSize,
        );

        title = Text(lang.unpacking);
        break;

      case InstallerState.settingUp:
        statusIcon = const Icon(
          YaruIcons.input_tablet,
        );
        title = Text(lang.installing);
        break;

      case InstallerState.running:
        statusIcon = const SizedBox(
          child: CircularProgressIndicator(),
          height: kSpanElementSize,
          width: kSpanElementSize,
        );
        title = Text(lang.launching);
        break;

      case InstallerState.done:
        statusIcon = const Icon(
          Icons.done_all_rounded,
        );
        title = Text(lang.done);
        break;

      case InstallerState.error:
        statusIcon = Icon(
          YaruIcons.error_filled,
          color: errorColor,
        );
        title = Text(lang.errorMsg);
        subtitle = Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            lang.errorSub,
            style: Theme.of(context).textTheme.caption,
          ),
        );
        break;
    }

    int maxLines = state == InstallerState.error ? 4 : 5;

    return InstallerStatus(
      title: title,
      statusIcon: statusIcon,
      log: log,
      maxLines: maxLines,
      subtitle: subtitle,
    );
  }
}
