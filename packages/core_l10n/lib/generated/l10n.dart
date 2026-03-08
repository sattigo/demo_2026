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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `О приложении`
  String get aboutApp {
    return Intl.message('О приложении', name: 'aboutApp', desc: '', args: []);
  }

  /// `Инициализационный экран`
  String get initialScreen_notClickable_original_appBarText {
    return Intl.message(
      'Инициализационный экран',
      name: 'initialScreen_notClickable_original_appBarText',
      desc: '',
      args: [],
    );
  }

  /// `На "fork page"`
  String get initialScreen_clickable_original_toForkScreenButton {
    return Intl.message(
      'На "fork page"',
      name: 'initialScreen_clickable_original_toForkScreenButton',
      desc: '',
      args: [],
    );
  }

  /// `Экран вилки`
  String get forkScreen_notClickable_original_appBarText {
    return Intl.message(
      'Экран вилки',
      name: 'forkScreen_notClickable_original_appBarText',
      desc: '',
      args: [],
    );
  }

  /// `Центральный текст`
  String get forkScreen_notClickable_original_centerText {
    return Intl.message(
      'Центральный текст',
      name: 'forkScreen_notClickable_original_centerText',
      desc: '',
      args: [],
    );
  }

  /// `Начать`
  String get landingScreen_clickable_original_getStartedButton {
    return Intl.message(
      'Начать',
      name: 'landingScreen_clickable_original_getStartedButton',
      desc: '',
      args: [],
    );
  }

  /// `Главный экран`
  String get homeScreen_notClickable_original_appBarText {
    return Intl.message(
      'Главный экран',
      name: 'homeScreen_notClickable_original_appBarText',
      desc: '',
      args: [],
    );
  }

  /// `На Fork Screen`
  String get homeScreen_clickable_original_toForkScreenButton {
    return Intl.message(
      'На Fork Screen',
      name: 'homeScreen_clickable_original_toForkScreenButton',
      desc: '',
      args: [],
    );
  }

  /// `Загрузить рецепты`
  String get homeScreen_clickable_original_fetchRecipesButton {
    return Intl.message(
      'Загрузить рецепты',
      name: 'homeScreen_clickable_original_fetchRecipesButton',
      desc: '',
      args: [],
    );
  }

  /// `Попробовать снова`
  String get homeScreen_clickable_original_tryAgainButton {
    return Intl.message(
      'Попробовать снова',
      name: 'homeScreen_clickable_original_tryAgainButton',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
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
