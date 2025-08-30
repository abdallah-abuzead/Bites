import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../generated/locale_keys.g.dart';
import '../../theme/app_colors.dart';
import '../app_text.dart';

class LoadingDialog extends StatelessWidget {
  final String? message;

  const LoadingDialog({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.only(top: 35.h, bottom: 30.h),
      constraints: BoxConstraints(maxWidth: 250.w, minWidth: 200.w),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13.r),
        borderSide: BorderSide.none,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: LoadingAnimationWidget.threeArchedCircle(color: AppColors.primary, size: 40.r),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [AppText(message ?? LocaleKeys.pleaseWait.tr(), fontWeight: FontWeight.w600)],
          ),
        ],
      ),
    );
  }
}

Future loadingDialog(BuildContext context, {String? message, bool canPop = false}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => PopScope(
      canPop: canPop,
      child: LoadingDialog(message: message),
    ),
  );
}
