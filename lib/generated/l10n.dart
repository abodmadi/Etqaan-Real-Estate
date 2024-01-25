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

  /// `Etqaan Real Estate`
  String get company_name {
    return Intl.message(
      'Etqaan Real Estate',
      name: 'company_name',
      desc: '',
      args: [],
    );
  }

  /// `More details about Etqaan`
  String get about_us {
    return Intl.message(
      'More details about Etqaan',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `projects`
  String get projects {
    return Intl.message(
      'projects',
      name: 'projects',
      desc: '',
      args: [],
    );
  }

  /// `Real Estates`
  String get real_estates {
    return Intl.message(
      'Real Estates',
      name: 'real_estates',
      desc: '',
      args: [],
    );
  }

  /// `Auctions`
  String get auctions {
    return Intl.message(
      'Auctions',
      name: 'auctions',
      desc: '',
      args: [],
    );
  }

  /// `project`
  String get project {
    return Intl.message(
      'project',
      name: 'project',
      desc: '',
      args: [],
    );
  }

  /// `Real Estate`
  String get real_estate {
    return Intl.message(
      'Real Estate',
      name: 'real_estate',
      desc: '',
      args: [],
    );
  }

  /// `Auction`
  String get auction {
    return Intl.message(
      'Auction',
      name: 'auction',
      desc: '',
      args: [],
    );
  }

  /// `News :`
  String get news {
    return Intl.message(
      'News :',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Our services :`
  String get our_services {
    return Intl.message(
      'Our services :',
      name: 'our_services',
      desc: '',
      args: [],
    );
  }

  /// `clients`
  String get clients {
    return Intl.message(
      'clients',
      name: 'clients',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
