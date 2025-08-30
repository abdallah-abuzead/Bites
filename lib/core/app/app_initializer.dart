import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../di/app_injections.dart';

class AppInitializer {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await AppInjections.init();
  }
}
