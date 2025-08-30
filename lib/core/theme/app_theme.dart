import 'package:bites/core/theme/app_font_weight.dart';
import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  static final theme = ThemeData(
    primaryColor: AppColors.primary,
    fontFamily: AppFontFamilies.cairo,
    scaffoldBackgroundColor: AppColors.primaryBackground,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSeed(primary: AppColors.primary, seedColor: AppColors.primary),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightContainer,
      titleTextStyle: TextStyle(
        color: AppColors.textPrimaryAccent,
        fontWeight: AppFontWeight.bold,
        fontSize: 16.sp,
      ),
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    textTheme: const TextTheme(bodySmall: TextStyle(color: AppColors.textPrimary, fontSize: 13)),
  );
}
