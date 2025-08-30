import 'package:bites/core/constants/app_assets.dart';
import 'package:bites/core/localization/app_locale.dart';
import 'package:bites/core/theme/app_colors.dart';
import 'package:bites/core/theme/app_font_weight.dart';
import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:bites/core/widgets/app_button.dart';
import 'package:bites/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/app_text.dart';

class LogoAndGoogleButtonSection extends StatelessWidget {
  const LogoAndGoogleButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.gradient3Background,
            AppColors.gradient1Background,
            AppColors.gradient2Background,
          ],
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          90.heightBox,
          SvgPicture.asset(AppAssets.logo),
          40.heightBox,
          AppButton(
            title: LocaleKeys.loginWith.tr(),
            onPressed: () {},
            fontWeight: AppFontWeight.semiBold,
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            icon: SvgPicture.asset(AppAssets.google),
            isIconAfter: AppLocale.isEnglish,
            backgroundColor: Colors.white,
            foregroundColor: AppColors.textPrimary,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowGoogleButton.withValues(alpha: 0.35),
                blurRadius: 12,
                spreadRadius: 0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          20.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: Divider(color: AppColors.grey, thickness: 1)),
                10.widthBox,
                AppText(
                  LocaleKeys.or.tr(),
                  color: AppColors.textPrimary.withValues(alpha: 0.5),
                  fontWeight: AppFontWeight.semiBold,
                ),
                10.widthBox,
                const Expanded(child: Divider(color: AppColors.grey, thickness: 1)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
