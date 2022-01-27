


import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'What to expect from Ubuntu on WSL';

  @override
  String get windowTitle => 'Installing Ubuntu on WSL';

  @override
  String get welcome => 'Welcome to Ubuntu';

  @override
  String get unpacking => 'Unpacking the distro';

  @override
  String get installing => 'Almost done. The installer requires your attention.';

  @override
  String get launching => 'Launching distro...';

  @override
  String get errorMsg => 'Something went wrong.';

  @override
  String get errorSub => 'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get done => 'All set. Enjoy using Ubuntu on WSL';

  @override
  String get ubuntuOnWsl => 'Install a complete Ubuntu terminal environment in minutes on Windows with Windows Subsystem for Linux (WSL).\n\nAccess the Linux terminal on Windows, develop cross-platform applications, and manage IT infrastructure without leaving Windows.';
}
