import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../theme/app_colors.dart';

enum ToastType { error, success, warning }

Future<bool?> showToast({required String message, ToastType type = ToastType.error}) async {
  return await Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: _getColor(type),
    textColor: Colors.white,
    fontSize: 16.sp,
  );
}

Color _getColor(ToastType type) {
  switch (type) {
    case ToastType.error:
      return AppColors.error;
    case ToastType.success:
      return AppColors.success;
    default:
      return AppColors.warning;
  }
}
