import 'package:bites/core/theme/app_colors.dart';
import 'package:bites/core/theme/app_font_weight.dart';
import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/app_text.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.trailing,
  });
  final String title;
  final String icon;
  final String? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateColor.transparent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 12,
              spreadRadius: -3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon, width: 24, height: 24),
            SizedBox(width: 12.w),
            AppText(title, fontSize: 16.sp, fontWeight: AppFontWeight.medium),
            const Spacer(),
            AppText(trailing ?? '', fontSize: 14.sp, color: Colors.grey),
            SizedBox(width: trailing != null ? 8.w : 0),
            Icon(Icons.arrow_forward_ios, color: AppColors.darkGrey, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
