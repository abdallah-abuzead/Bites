import 'package:bites/core/constants/app_assets.dart';
import 'package:bites/core/theme/app_colors.dart';
import 'package:bites/core/theme/app_font_weight.dart';
import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:bites/core/widgets/app_text.dart';
import 'package:bites/features/chat/domain/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    // Assume senderId 1 is the current user
    final bool isMe = message.senderId == 1;
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Message container
        Flexible(
          child: Container(
            margin: EdgeInsetsGeometry.directional(start: isMe ? 0 : 30.w),
            padding: EdgeInsetsGeometry.directional(
              top: 12.h,
              bottom: 12.h,
              start: 16.w,
              end: 25.w,
            ),
            decoration: BoxDecoration(
              color: isMe ? AppColors.primary : AppColors.lightContainer,
              borderRadius: isMe
                  ? BorderRadiusDirectional.only(
                      topStart: Radius.circular(10.r),
                      topEnd: Radius.circular(10.r),
                      bottomEnd: Radius.circular(10.r),
                    )
                  : BorderRadiusDirectional.only(
                      topStart: Radius.circular(10.r),
                      bottomStart: Radius.circular(10.r),
                      bottomEnd: Radius.circular(10.r),
                    ),
            ),
            child: AppText(
              message.content,
              fontWeight: AppFontWeight.medium,
              color: isMe ? AppColors.textLight : AppColors.textPrimary,
              height: 1.7,
            ),
          ),
        ),
        // Avatar for other users (left side)
        if (!isMe) ...[10.widthBox, SvgPicture.asset(AppAssets.contact, width: 24.w)],
      ],
    );
  }
}
