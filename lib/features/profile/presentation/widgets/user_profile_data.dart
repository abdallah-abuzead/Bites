import 'package:bites/core/theme/app_colors.dart';
import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_text.dart';

class UserProfileData extends StatelessWidget {
  const UserProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50.r,
          child: Icon(Icons.person, size: 50.sp),
        ),
        20.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText('User Name', fontSize: 18.sp, fontWeight: FontWeight.bold),
            5.heightBox,
            AppText('example@email.com', fontSize: 16.sp, color: AppColors.darkGrey),
          ],
        ),
      ],
    );
  }
}
