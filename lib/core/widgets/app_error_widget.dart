import 'package:bites/core/constants/app_strings.dart';
import 'package:bites/core/utils/extensions/routing_extensions.dart';
import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:bites/features/auth/presentation/screens/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../generated/locale_keys.g.dart';
import '../constants/app_assets.dart';
import '../networking/failures.dart';
import '../theme/app_colors.dart';
import 'app_button.dart';
import 'app_text.dart';

class AppErrorWidget extends StatelessWidget {
  final Failure failure;
  final void Function()? onPressed;
  const AppErrorWidget({super.key, required this.failure, this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (failure is OfflineFailure) {
      return _OfflineErrorWidget(onPressed: onPressed);
    } else if (failure is UnauthorizedFailure) {
      return const _UnauthorizedErrorWidget();
    } else {
      return _ServerErrorWidget(message: getFailureMessage(failure), onPressed: onPressed);
    }
  }
}

class _ServerErrorWidget extends StatelessWidget {
  const _ServerErrorWidget({this.onPressed, required this.message});
  final void Function()? onPressed;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AppAssets.serverErrorLottie, height: 100.h),
        10.heightBox,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: AppText(message, textAlign: TextAlign.center, color: AppColors.textPrimaryAccent),
        ),
        20.heightBox,
        AppButton(
          onPressed: onPressed,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          width: 150.w,
          height: 40.h,
          title: LocaleKeys.tryAgain.tr(),
        ),
      ],
    );
  }
}

class _OfflineErrorWidget extends StatelessWidget {
  const _OfflineErrorWidget({this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AppAssets.offlineErrorLottie, height: 150.h),
        5.heightBox,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: AppText(
            AppStrings.offlineErrorMessage.tr(),
            textAlign: TextAlign.center,
            color: AppColors.grey,
          ),
        ),
        20.heightBox,
        AppButton(
          onPressed: onPressed,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          width: 150.w,
          height: 40.h,
          title: LocaleKeys.tryAgain.tr(),
        ),
      ],
    );
  }
}

class _UnauthorizedErrorWidget extends StatelessWidget {
  const _UnauthorizedErrorWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AppAssets.unauthorizedErrorLottie, height: 150.h),
        5.heightBox,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: AppText(
            AppStrings.unauthorizedErrorMessage.tr(),
            textAlign: TextAlign.center,
            color: AppColors.grey,
          ),
        ),
        20.heightBox,
        AppButton(
          onPressed: () => context.pushAndRemoveUntil(const LoginScreen()),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          width: 150.w,
          height: 40.h,
          title: LocaleKeys.tryAgain.tr(),
        ),
      ],
    );
  }
}

class EmptyWidget extends StatelessWidget {
  final void Function()? onPressed;
  const EmptyWidget({super.key, this.onPressed, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AppAssets.emptyLottie, height: 150.h),
        5.heightBox,
        AppText(text, color: AppColors.grey),
        20.heightBox,
        AppButton(
          onPressed: () => onPressed,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          width: 150.w,
          height: 40.h,
          title: LocaleKeys.reload.tr(),
        ),
      ],
    );
  }
}
