
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ro')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'What to expect from Ubuntu on WSL'**
  String get appTitle;

  /// No description provided for @windowTitle.
  ///
  /// In en, this message translates to:
  /// **'Installing Ubuntu on WSL'**
  String get windowTitle;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Ubuntu WSL'**
  String get welcome;

  /// No description provided for @initializing.
  ///
  /// In en, this message translates to:
  /// **'Initializing...'**
  String get initializing;

  /// No description provided for @unpacking.
  ///
  /// In en, this message translates to:
  /// **'Unpacking the distro'**
  String get unpacking;

  /// No description provided for @installing.
  ///
  /// In en, this message translates to:
  /// **'Almost done. The installer will require your attention soon.'**
  String get installing;

  /// No description provided for @launching.
  ///
  /// In en, this message translates to:
  /// **'Launching distro...'**
  String get launching;

  /// No description provided for @errorMsg.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get errorMsg;

  /// No description provided for @errorSub.
  ///
  /// In en, this message translates to:
  /// **'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME'**
  String get errorSub;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'All set. Enjoy using Ubuntu on WSL'**
  String get done;

  /// No description provided for @exitTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to leave?'**
  String get exitTitle;

  /// No description provided for @exitContents.
  ///
  /// In en, this message translates to:
  /// **'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.'**
  String get exitContents;

  /// No description provided for @customExitTitle.
  ///
  /// In en, this message translates to:
  /// **'We are almost done'**
  String get customExitTitle;

  /// No description provided for @customExitContents.
  ///
  /// In en, this message translates to:
  /// **'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?'**
  String get customExitContents;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @leave.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get leave;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @ubuntuOnWsl.
  ///
  /// In en, this message translates to:
  /// **'Ubuntu on WSL'**
  String get ubuntuOnWsl;

  /// No description provided for @ubuntuOnWslText.
  ///
  /// In en, this message translates to:
  /// **'A full Ubuntu environment, deeply integrated with Windows, for Linux application development and execution. Optimised for cloud, web, data science, IOT and fun!'**
  String get ubuntuOnWslText;

  /// No description provided for @ubuntuWslWebDev.
  ///
  /// In en, this message translates to:
  /// **'Ubuntu WSL for\nWeb Development'**
  String get ubuntuWslWebDev;

  /// No description provided for @ubuntuWslWebDevText.
  ///
  /// In en, this message translates to:
  /// **'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit\nfrom full NodeJS and Ruby support.'**
  String get ubuntuWslWebDevText;

  /// No description provided for @ubuntuWslDataScience.
  ///
  /// In en, this message translates to:
  /// **'Ubuntu WSL for Data Science'**
  String get ubuntuWslDataScience;

  /// No description provided for @ubuntuWslDataScienceText.
  ///
  /// In en, this message translates to:
  /// **'NVIDIA Data Science Stack lets you maximize the performance of Data Science and\nMachine Learning projects on top of native Windows NVIDIA drivers.'**
  String get ubuntuWslDataScienceText;

  /// No description provided for @ubuntuWslGuiApps.
  ///
  /// In en, this message translates to:
  /// **'Ubuntu WSL for\nGraphical Apps'**
  String get ubuntuWslGuiApps;

  /// No description provided for @ubuntuWslGuiAppsText.
  ///
  /// In en, this message translates to:
  /// **'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.'**
  String get ubuntuWslGuiAppsText;

  /// No description provided for @ubuntuWslDevOps.
  ///
  /// In en, this message translates to:
  /// **'Ubuntu WSL for DevOps'**
  String get ubuntuWslDevOps;

  /// No description provided for @ubuntuWslDevOpsText.
  ///
  /// In en, this message translates to:
  /// **'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment'**
  String get ubuntuWslDevOpsText;

  /// No description provided for @ubuntuWslEnterprises.
  ///
  /// In en, this message translates to:
  /// **'Ubuntu WSL for Enterprises'**
  String get ubuntuWslEnterprises;

  /// No description provided for @ubuntuWslEnterprisesText.
  ///
  /// In en, this message translates to:
  /// **'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.'**
  String get ubuntuWslEnterprisesText;

  /// No description provided for @findOutMore.
  ///
  /// In en, this message translates to:
  /// **'Find out more'**
  String get findOutMore;

  /// No description provided for @findOutMoreVisit.
  ///
  /// In en, this message translates to:
  /// **'Visit '**
  String get findOutMoreVisit;

  /// No description provided for @findOutMoreLink.
  ///
  /// In en, this message translates to:
  /// **'Ubuntu.com/wsl'**
  String get findOutMoreLink;

  /// No description provided for @findOutMoreText.
  ///
  /// In en, this message translates to:
  /// **' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.'**
  String get findOutMoreText;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'pt', 'ro'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt': {
  switch (locale.countryCode) {
    case 'BR': return AppLocalizationsPtBr();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'pt': return AppLocalizationsPt();
    case 'ro': return AppLocalizationsRo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
