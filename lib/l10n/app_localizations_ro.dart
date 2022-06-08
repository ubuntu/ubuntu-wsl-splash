


import 'app_localizations.dart';

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'La ce să te aștepți de la Ubuntu pe WSL';

  @override
  String get windowTitle => 'Instalare Ubuntu pe WSL';

  @override
  String get welcome => 'Bun venit la Ubuntu pe WSL';

  @override
  String get initializing => 'Se inițializează...';

  @override
  String get unpacking => 'Se despachetează distro-ul';

  @override
  String get installing => 'Aproape gata. Instalatorul va necesita atenția ta curând.';

  @override
  String get launching => 'Se pornește distro-ul...';

  @override
  String get errorMsg => 'Ceva nu a mers.';

  @override
  String get errorSub => 'Te rugăm să restartezi WSL utilizând următoarea comandă, apoi reîncearcă:\n\twsl --shutdown\n\twsl --unregister NUME_DISTRO';

  @override
  String get done => 'Am terminat. Spor la utilizarea Ubuntu pe WSL';

  @override
  String get exitTitle => 'Ești sigur că dorești să renunți?';

  @override
  String get exitContents => 'Instalarea va continua în fundal chiar și după ce închizi această fereastră.\n\nÎn plus, poți continua să explorezi ce vei putea realiza cu Ubuntu pe WSL.';

  @override
  String get customExitTitle => 'Aproape am terminat';

  @override
  String get customExitContents => 'Mai sunt câțiva pași de completat în fereastra principală de instalare.\nPutem închide fereastra asta și să continuăm acolo?';

  @override
  String get ok => 'Ok';

  @override
  String get leave => 'Renunță';

  @override
  String get cancel => 'Anulează';

  @override
  String get ubuntuOnWsl => 'Ubuntu pe WSL';

  @override
  String get ubuntuOnWslText => 'Un mediu Ubuntu complet, adânc integrat cu Windows, pentru dezvoltarea și execuția aplicațiilor de Linux. Optimizat pentru cloud, web, știința datelor, IOT, și distracție!';

  @override
  String get ubuntuWslWebDev => 'Ubuntu WSL pentru\nDezvoltare Web';

  @override
  String get ubuntuWslWebDevText => 'Dezvoltă în WSL utilizând IDE-uri native Windows, incluzând VS Code și IntelliJ, și beneficiază\nde suport complet pentru NodeJS și Ruby.';

  @override
  String get ubuntuWslDataScience => 'Ubuntu WSL pentru Știința Datelor';

  @override
  String get ubuntuWslDataScienceText => 'NVIDIA Data Science Stack îți permite să maximizezi performanța proiectelor\nde Data Science și Machine Learning alături de driverele native Windows NVIDIA.';

  @override
  String get ubuntuWslGuiApps => 'Ubuntu WSL pentru\nAplicații Grafice';

  @override
  String get ubuntuWslGuiAppsText => 'Dezvoltă și previzualizează aplicații web și grafice pe Linux folosind WSLg pentru o experiență multi-platformă.';

  @override
  String get ubuntuWslDevOps => 'Ubuntu WSL pentru DevOps';

  @override
  String get ubuntuWslDevOpsText => 'Asigură compatibilitatea sistemelor de CI/CD prin dezvoltarea locală pe Ubuntu WSL, înaintea publicării într-un mediu Ubuntu de producție';

  @override
  String get ubuntuWslEnterprises => 'Ubuntu WSL pentru Întreprinderi';

  @override
  String get ubuntuWslEnterprisesText => 'Încurajează dezvoltatorii dintr-un\necosistem Windows enterprise printr-un\nUbuntu LTS certificat.';

  @override
  String get findOutMore => 'Află mai mult';

  @override
  String get findOutMoreVisit => 'Vizitează ';

  @override
  String get findOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get findOutMoreText => ' pentru a afla mai multe despre Ubuntu pe WSL și cum susține Canonical dezvoltatorii și organizațiile.';
}
