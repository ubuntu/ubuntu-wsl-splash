import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wsl_splash/app_home.dart';
import 'package:ubuntu_wsl_splash/installer_state_controller.dart';
import 'package:ubuntu_wsl_splash/l10n/app_localizations.dart';

import 'package:ubuntu_wsl_splash/slide.dart';
import 'package:yaru_icons/widgets/yaru_icons.dart';

void main() {
  testWidgets('AppHome Installer Status integration',
      (WidgetTester tester) async {
    // Given
    const expectedStates = <InstallerState>[
      InstallerState.initializing,
      InstallerState.unpacking,
      InstallerState.settingUp,
      InstallerState.running,
      InstallerState.error,
      InstallerState.done,
    ];

    const title = "Ubuntu on WSL";
    const asset = AssetImage("assets/ubuntu-on-wsl.png");

    const slides = [
      Slide(image: asset, title: title, text: "1"),
      Slide(image: asset, title: title, text: "2"),
      Slide(image: asset, title: title, text: "3"),
    ];
    final controller = FakeController();
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
            body: AppHome(
          slides: slides,
          controller: controller,
        )),
      ),
    );
    // When

    for (final state in expectedStates) {
      controller.add(state);
      await tester.pump();
      switch (state) {
        case InstallerState.initializing:
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
          break;
        case InstallerState.unpacking:
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
          break;
        case InstallerState.settingUp:
          expect(find.byIcon(YaruIcons.input_tablet), findsOneWidget);
          break;
        case InstallerState.running:
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
          break;
        case InstallerState.done:
          expect(find.byIcon(Icons.done_all_rounded), findsOneWidget);
          break;
        case InstallerState.error:
          expect(find.byIcon(YaruIcons.error_filled), findsOneWidget);
          break;
        default:
          expect(
            0,
            1,
            reason: "All states should be mapped, leave no room for defaults.",
          );
          break;
      }
    }

    // Then
  });
}

/// Fake and dummy controller just to satisfy the widget with the expected API.
class FakeController implements InstallerStateController {
  static const stdoutMessages = [
    "Installing, this may take a few minutes...",
    "Installation successful!",
    "Launching the OOBE",
    "flutter: INFO ubuntu_wsl_setup: Logging to /var/log/installer/ubuntu_wsl_setup.log",
    "flutter: ERROR ubuntu_wsl_setup: FontConfig cannot find default files",
    "Error: OOBE not found.",
  ];

  @override
  void dispose() {
    _stateController.close();
  }

  @override
  Stream<String> get journal => Stream<String>.fromIterable(stdoutMessages);

  @override
  void processJournalInput(String line) {
    //does nothing.
  }

  @override
  InstallerState get state => throw UnimplementedError();

  @override
  Stream<InstallerState> get states => _stateController.stream;

  final _stateController = StreamController<InstallerState>(sync: true);

  void add(InstallerState state) => _stateController.sink.add(state);
}
