import 'package:bites/core/theme/app_font_weight.dart';
import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Widget? icon;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? textColor;
  final BorderSide? side;
  final double? width;
  final double? height;
  final double? separatorWidth;
  final Color disabledBackgroundColor;
  final bool isIconAfter;
  final bool wrapWithContainer;
  final Widget? child;
  final TextStyle? textStyle;
  final List<BoxShadow>? boxShadow;
  final double? elevation;
  final FontWeight? fontWeight;

  const AppButton({
    required this.title,
    required this.onPressed,
    this.icon,
    this.radius = 13,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.isIconAfter = false,
    this.disabledBackgroundColor = AppColors.grey,
    this.foregroundColor,
    this.side,
    this.width,
    this.separatorWidth,
    this.height,
    this.wrapWithContainer = false,
    super.key,
    this.child,
    this.textStyle,
    this.textColor,
    this.boxShadow,
    this.elevation,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(boxShadow: boxShadow),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: foregroundColor ?? Colors.white,
          padding: wrapWithContainer
              ? EdgeInsets.zero
              : padding ?? EdgeInsets.symmetric(vertical: 14.h),
          elevation: elevation ?? 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.r)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          disabledBackgroundColor: disabledBackgroundColor,
          disabledForegroundColor: Colors.white,
          side: side,
        ),
        child:
            child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              textDirection: isIconAfter ? TextDirection.rtl : TextDirection.ltr,
              children: [
                icon ?? Container(),
                SizedBox(width: icon == null ? 0 : (separatorWidth ?? 12).w),
                Text(
                  title,
                  style:
                      textStyle ??
                      TextStyle(fontSize: 14.sp, fontWeight: fontWeight ?? AppFontWeight.bold),
                ),
              ],
            ),
      ),
    );
  }
}
