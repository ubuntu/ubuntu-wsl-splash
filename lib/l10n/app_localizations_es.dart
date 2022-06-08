


import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Qué esperar de Ubuntu en WSL';

  @override
  String get windowTitle => 'Instalando Ubuntu en WSL';

  @override
  String get welcome => 'Bienvenido a Ubuntu WSL';

  @override
  String get initializing => 'Inicializando...';

  @override
  String get unpacking => 'Desempaquetando la distro';

  @override
  String get installing => 'Casi hemos terminado. El instalador pronto requerirá su atención.';

  @override
  String get launching => 'Iniciando la distro...';

  @override
  String get errorMsg => 'Algo ha ido mal.';

  @override
  String get errorSub => 'Por favor, reinicie WSL con el siguiente comando e inténtelo de nuevo:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get done => 'Todo listo. Disfrute usando Ubuntu en WSL';

  @override
  String get exitTitle => '¿Está seguro que quiere salir?';

  @override
  String get exitContents => 'Cerrar esta ventana no impedirá que la instalación continúe en segundo plano.\n\nAdemás, puede seguir explorando lo que puede hacer con Ubuntu en WSL.';

  @override
  String get customExitTitle => 'Ya casi hemos terminado.';

  @override
  String get customExitContents => 'Solo faltan unos pocos pasos por completar en la ventana principal del instalador.\n¿Podemos salir de esta e ir allí?';

  @override
  String get ok => 'Ok';

  @override
  String get leave => 'Salir';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ubuntuOnWsl => 'Ubuntu en WSL';

  @override
  String get ubuntuOnWslText => 'Un entorno completo de Ubuntu, profundamente integrado con Windows, para el desarrollo y ejecución de aplicaciones Linux. Optimizado para la nube, la web, la ciencia de datos, el IOT, ¡y la diversión!';

  @override
  String get ubuntuWslWebDev => 'Ubuntu WSL para\nDesarrollo Web';

  @override
  String get ubuntuWslWebDevText => 'Desarrolle en WSL usando IDEs nativos de Windows, incluyendo VS Code e IntelliJ, y benefíciese del soporte completo de NodeJS y Ruby.';

  @override
  String get ubuntuWslDataScience => 'Ubuntu WSL para Ciencia de Datos';

  @override
  String get ubuntuWslDataScienceText => 'NVIDIA Data Science Stack permite maximizar el rendimiento de los proyectos de Data Science y Machine Learning sobre los drivers nativos de NVIDIA para Windows.';

  @override
  String get ubuntuWslGuiApps => 'Ubuntu WSL para\nApps Gráficas';

  @override
  String get ubuntuWslGuiAppsText => 'Desarrolle y previsualice aplicaciones web y gráficas en Linux utilizando WSLg para el desarrollo multiplataforma';

  @override
  String get ubuntuWslDevOps => 'Ubuntu WSL para DevOps';

  @override
  String get ubuntuWslDevOpsText => 'Garantice la compatibilidad de la CI/CD pipeline desarrollando en Ubuntu WSL localmente antes de publicar en un entorno de producción de Ubuntu';

  @override
  String get ubuntuWslEnterprises => 'Ubuntu WSL para Empresas';

  @override
  String get ubuntuWslEnterprisesText => 'Empodere a los desarrolladores en un ecosistema \nWindows empresarial con un \nUbuntu LTS certificado.';

  @override
  String get findOutMore => 'Descubra más';

  @override
  String get findOutMoreVisit => 'Visite';

  @override
  String get findOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get findOutMoreText => ' para saber más sobre Ubuntu en WSL y sobre cómo Canonical apoya a desarrolladores y organizaciones.';
}
