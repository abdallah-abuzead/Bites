import 'package:bites/core/constants/app_assets.dart';
import 'package:bites/core/utils/extensions/routing_extensions.dart';
import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:bites/core/widgets/app_text.dart';
import 'package:bites/features/chat/presentation/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/contact.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;

  const ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: InkWell(
        onTap: () => context.push(ChatScreen(contact: contact)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowGoogleButton.withValues(alpha: 0.1),
                blurRadius: 12,
                spreadRadius: 0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.contact),
              10.widthBox,
              AppText(contact.name, fontSize: 16.sp),
            ],
          ),
        ),
      ),
    );
  }
}
