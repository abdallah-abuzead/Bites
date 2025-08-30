import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app/app_initializer.dart';
import 'core/app/my_app.dart';
import 'core/constants/app_assets.dart';
import 'core/localization/app_locale.dart';

Future<void> main() async {
  await AppInitializer.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [AppLocale.english, AppLocale.arabic],
      path: AppAssets.translations,
      startLocale: AppLocale.arabic,
      fallbackLocale: AppLocale.arabic,
      child: const ProviderScope(child: MyApp()),
    ),
  );
}
