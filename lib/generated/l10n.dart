// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `LuoXun`
  String get appName {
    return Intl.message(
      'LuoXun',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `You have pushed the button this many times:`
  String get pushLabel {
    return Intl.message(
      'You have pushed the button this many times:',
      name: 'pushLabel',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get navigationHome {
    return Intl.message(
      'Home',
      name: 'navigationHome',
      desc: '',
      args: [],
    );
  }

  /// `Find`
  String get navigationFind {
    return Intl.message(
      'Find',
      name: 'navigationFind',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get navigationMap {
    return Intl.message(
      'Map',
      name: 'navigationMap',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get navigationMessage {
    return Intl.message(
      'Message',
      name: 'navigationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Mine`
  String get navigationMine {
    return Intl.message(
      'Mine',
      name: 'navigationMine',
      desc: '',
      args: [],
    );
  }

  /// `click again to exit`
  String get exitBy2Click {
    return Intl.message(
      'click again to exit',
      name: 'exitBy2Click',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get menuSettings {
    return Intl.message(
      'Settings',
      name: 'menuSettings',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get menuAbout {
    return Intl.message(
      'About',
      name: 'menuAbout',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get menuLanguage {
    return Intl.message(
      'Language',
      name: 'menuLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get menuTheme {
    return Intl.message(
      'Theme',
      name: 'menuTheme',
      desc: '',
      args: [],
    );
  }

  /// `LogOut`
  String get menuLogOut {
    return Intl.message(
      'LogOut',
      name: 'menuLogOut',
      desc: '',
      args: [],
    );
  }

  /// `Chinese`
  String get languageChinese {
    return Intl.message(
      'Chinese',
      name: 'languageChinese',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get languageEnglish {
    return Intl.message(
      'English',
      name: 'languageEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get languageAuto {
    return Intl.message(
      'Auto',
      name: 'languageAuto',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
