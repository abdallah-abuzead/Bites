import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_weight.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../generated/locale_keys.g.dart';

class ImageAndAskMeText extends StatelessWidget {
  const ImageAndAskMeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.17),
                blurRadius: 12,
                spreadRadius: -6,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          child: SvgPicture.asset(AppAssets.chatbot),
        ),
        10.heightBox,
        AppText(
          LocaleKeys.askMe.tr(),
          fontSize: 22.sp,
          color: AppColors.primary,
          textAlign: TextAlign.center,
          fontWeight: AppFontWeight.bold,
        ),
      ],
    );
  }
}
