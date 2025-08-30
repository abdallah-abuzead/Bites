import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';
import '../theme/app_font_weight.dart';
import 'app_text.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final TextInputAction action;
  final String? hint;
  final String? title;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool readOnly;
  final bool autoFocus;
  final Color fillColor;
  final Color? enabledBorderColor;
  final String? keyError;
  final Map<String, dynamic>? errors;
  final List<TextInputFormatter>? inputFormatters;
  final int? minLines;
  final bool? enabled;
  final int? maxLines;
  final double radius;
  final double? suffixPadding;
  final double suffixIconMaxWidth;
  final bool filled;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final BoxConstraints? prefixIconConstraints;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingFinish;
  final bool isLabel;

  const AppTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.hint,
    this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.action = TextInputAction.next,
    this.isPassword = false,
    this.readOnly = false,
    this.suffixPadding,
    this.autoFocus = false,
    this.fillColor = Colors.white,
    this.enabledBorderColor,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.prefixIconConstraints,
    this.keyError,
    this.inputFormatters,
    this.errors,
    this.minLines,
    this.enabled = true,
    this.maxLines = 1,
    this.radius = 13,
    this.suffixIconMaxWidth = 35,
    this.filled = true,
    this.contentPadding,
    this.onTap,
    this.focusNode,
    this.onFieldSubmitted,
    this.onEditingFinish,
    this.isLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? const SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: AppText(title!, fontSize: 14.sp, fontWeight: AppFontWeight.semiBold),
              ),
        TextFormField(
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
          onTap: onTap,
          enabled: enabled,
          onEditingComplete: onEditingFinish,
          keyboardType: keyboardType,
          textInputAction: action,
          obscureText: isPassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: AppColors.textPrimary,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14.sp,
            fontWeight: AppFontWeight.medium,
          ),
          readOnly: readOnly,
          autofocus: autoFocus,
          inputFormatters: inputFormatters,
          minLines: minLines,
          maxLines: maxLines,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            isDense: true,
            hintText: hint,
            filled: filled,
            labelText: isLabel ? hint : null,
            fillColor: fillColor,
            contentPadding:
                contentPadding ?? EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: suffixPadding ?? 8.w),
              child: suffixIcon ?? const SizedBox.shrink(),
            ),
            errorMaxLines: 2,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary.withValues(alpha: 0.5), width: 1.5.w),
              borderRadius: BorderRadius.circular(radius.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: enabledBorderColor ?? AppColors.textLight),
              borderRadius: BorderRadius.circular(radius.r),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(radius.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.error, width: 1.5.w),
              borderRadius: BorderRadius.circular(radius.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.error, width: 1.5.w),
              borderRadius: BorderRadius.circular(radius.r),
            ),
          ),
        ),
      ],
    );
  }
}
