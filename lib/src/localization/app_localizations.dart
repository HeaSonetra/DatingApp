import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_km.dart';

/// Callers can lookup localized strings with Localizations.of<AppLocalizations>(context)!.
///
/// This is only intended to be used from application code. For libraries,
/// consider creating a separate AppLocalizations instance.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('km'),
  ];

  /// The title of the application
  String get appTitle;

  /// Login button text
  String get login;

  /// Register button text
  String get register;

  /// Email field label
  String get email;

  /// Password field label
  String get password;

  /// Confirm password field label
  String get confirmPassword;

  /// Full name field label
  String get fullName;

  /// Age field label
  String get age;

  /// Location field label
  String get location;

  /// Search button text
  String get search;

  /// Filter button text
  String get filter;

  /// Home tab label
  String get home;

  /// Messages tab label
  String get messages;

  /// Profile tab label
  String get profile;

  /// Settings tab label
  String get settings;

  /// Like button text
  String get like;

  /// Message button text
  String get message;

  /// Skip button text
  String get skip;

  /// Next button text
  String get next;

  /// Get started button text
  String get getStarted;

  /// Welcome message
  String get welcome;

  /// Welcome description
  String get welcomeDescription;

  /// Discover onboarding title
  String get discoverTitle;

  /// Discover onboarding description
  String get discoverDescription;

  /// Connect onboarding title
  String get connectTitle;

  /// Connect onboarding description
  String get connectDescription;

  /// Language settings title
  String get languageSettings;

  /// English language option
  String get english;

  /// Khmer language option
  String get khmer;

  /// Age range filter label
  String get ageRange;

  /// Distance filter label
  String get distance;

  /// Interests label
  String get interests;

  /// Bio label
  String get bio;

  /// Photos label
  String get photos;

  /// Online status
  String get online;

  /// Offline status
  String get offline;

  /// Message input placeholder
  String get typeMessage;

  /// Send button text
  String get send;

  /// No messages placeholder
  String get noMessages;

  /// Start conversation text
  String get startConversation;

  /// Logout button text
  String get logout;

  /// Edit profile button text
  String get editProfile;

  /// Save button text
  String get save;

  /// Cancel button text
  String get cancel;

  /// Forgot password link text
  String get forgotPassword;

  /// Don't have account text
  String get dontHaveAccount;

  /// Already have account text
  String get alreadyHaveAccount;

  /// Years old suffix
  String get yearsOld;

  /// Kilometers away suffix
  String get kmAway;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'km'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'km':
      return AppLocalizationsKm();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue on GitHub with a '
    'reproducible sample app and the gen-l10n configuration that was used.',
  );
}
