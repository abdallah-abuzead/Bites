import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../domain/message.dart';
import '../providers/chat_provider.dart';

class ChatInputField extends ConsumerWidget {
  ChatInputField({super.key});

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        IconButton(
          onPressed: () => messageController.clear(),
          icon: SvgPicture.asset(AppAssets.brush),
        ),
        Expanded(
          child: AppTextField(
            controller: messageController,
            suffixIcon: IconButton(
              onPressed: () {
                if (messageController.text.isNotEmpty) {
                  ref
                      .read(chatProvider.notifier)
                      .addMessage(
                        Message(content: messageController.text, senderId: 1, receiverId: 2),
                      );
                  messageController.clear();
                }
              },
              icon: SvgPicture.asset(AppAssets.send, width: 24.w),
            ),
          ),
        ),
      ],
    );
  }
}
