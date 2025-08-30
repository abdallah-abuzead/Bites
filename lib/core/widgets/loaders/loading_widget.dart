import 'package:bites/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.padding});
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 0),
      child: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: AppColors.primary.withValues(alpha: 0.7),
          size: 40.r,
        ),
      ),
    );
  }
}
