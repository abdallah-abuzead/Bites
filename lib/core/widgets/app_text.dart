import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
  final TextDecoration? decoration;
  final double? letterSpacing;
  final Color? decorationColor;
  final bool isUnderline;

  const AppText(
    this.text, {
    this.fontSize,
    this.fontFamily = AppFontFamilies.cairo,
    this.fontWeight,
    this.textAlign,
    this.decorationColor,
    this.color = AppColors.textPrimary,
    this.overflow,
    this.maxLines,
    this.height,
    this.isUnderline = false,
    this.decoration,
    this.letterSpacing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize ?? 13.sp,
        fontFamily: fontFamily,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: isUnderline ? Colors.transparent : color,
        height: height,
        decoration: decoration,
        letterSpacing: letterSpacing,
        decorationColor: decorationColor,

        shadows: [
          if (isUnderline) Shadow(color: color ?? Colors.white, offset: const Offset(0, -2)),
        ],
      ),
    );
  }
}
