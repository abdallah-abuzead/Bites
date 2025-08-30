import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../utils/extensions/routing_extensions.dart';

class AppLocale {
  static const Locale english = Locale('en', 'US');
  static const Locale arabic = Locale('ar', 'EG');

  static bool get isEnglish => currentContext!.locale == english;

  static Future<void> toggleLocale() async {
    await currentContext!.setLocale(isEnglish ? arabic : english);
  }

  static Future<void> setLocale(Locale locale) async {
    await currentContext!.setLocale(locale);
  }
}
