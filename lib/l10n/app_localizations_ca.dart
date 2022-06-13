


import 'app_localizations.dart';

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'Què esperar d\'Ubuntu a WSL';

  @override
  String get windowTitle => 'Instal·lació d\'Ubuntu a WSL';

  @override
  String get welcome => 'Benvingut a Ubuntu WSL';

  @override
  String get initializing => 'Inicialitzant...';

  @override
  String get unpacking => 'Desempaquetant la distribució';

  @override
  String get installing => 'Quasi fet. L\'instal·lador requerirà la vostra atenció d\'aquí poc.';

  @override
  String get launching => 'Iniciant la distro...';

  @override
  String get errorMsg => 'Quelcom ha anat malament.';

  @override
  String get errorSub => 'Si us plau, reiniciï WSL amb l\'ordre següent i torneu-ho a provar:\n\twsl --shutdown\n\twsl --unregister NOM_DE_LA_DISTRO';

  @override
  String get done => 'Llest. Gaudeix utilitzant Ubuntu a WSL';

  @override
  String get exitTitle => 'Està segur que vol sortir?';

  @override
  String get exitContents => 'Tancant aquesta finestra no impedirà que la instal·lació continuï en segon pla.\n\nA part, podeu continuar explorant què es pot fer amb Ubuntu a WSL.';

  @override
  String get customExitTitle => 'Gairebé hem acabat';

  @override
  String get customExitContents => 'Només queda fer uns quants passos a la finestra principal de l\'instal·lador.\nPodem sortir d\'aquesta i anar-hi?';

  @override
  String get ok => 'D\'acord';

  @override
  String get leave => 'Sortir';

  @override
  String get cancel => 'Cancel·lar';

  @override
  String get ubuntuOnWsl => 'Ubuntu a WSL';

  @override
  String get ubuntuOnWslText => 'Un entorn Ubuntu complet, profundament integrat amb Windows, per al desenvolupament i l\'execució d\'aplicacions Linux. Optimitzat per al núvol, la web, la ciència de dades, IOT i la diversió!';

  @override
  String get ubuntuWslWebDev => 'Ubuntu WSL per al\ndesenvolupament web';

  @override
  String get ubuntuWslWebDevText => 'Desenvolupi a WSL utilitzant IDE natius de Windows, inclosos VS Code i IntelliJ, i beneficiï\'s\ndel suport complet de NodeJS i Ruby.';

  @override
  String get ubuntuWslDataScience => 'Ubuntu WSL per a la Ciència de Dades';

  @override
  String get ubuntuWslDataScienceText => 'L\'NVIDIA Data Science Stack li permet maximitzar el rendiment dels projectes de Data Science i\nMachine Learning a més dels controladors NVIDIA natius de Windows.';

  @override
  String get ubuntuWslGuiApps => 'Ubuntu WSL per a\nAplicacions Gràfiques';

  @override
  String get ubuntuWslGuiAppsText => 'Desenvolupi i previsualitzi aplicacions web i gràfiques a Linux mitjançant WSLg per al desenvolupament multiplataforma.';

  @override
  String get ubuntuWslDevOps => 'Ubuntu WSL per a DevOps';

  @override
  String get ubuntuWslDevOpsText => 'Asseguri la compatibilitat del pipeline CI/CD desenvolupant a Ubuntu WSL localment abans de publicar a un entorn de producció d\'Ubuntu';

  @override
  String get ubuntuWslEnterprises => 'Ubuntu WSL per a Empreses';

  @override
  String get ubuntuWslEnterprisesText => 'Empoderi als i les desenvolupadores en un ecosistema Windows\nEnterprise amb un \nUbuntu LTS certificat.';

  @override
  String get findOutMore => 'Saber-ne més';

  @override
  String get findOutMoreVisit => 'Visiti ';

  @override
  String get findOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get findOutMoreText => ' per obtenir més informació sobre Ubuntu a WSL i sobre com Canonical dona suport a desenvolupadors i organitzacions.';
}
