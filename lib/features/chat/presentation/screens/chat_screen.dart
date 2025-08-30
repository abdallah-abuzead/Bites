import 'package:bites/core/theme/app_colors.dart';
import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:bites/features/chat/presentation/providers/chat_provider.dart';
import 'package:bites/features/contacts/domain/entities/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/chat_input_field.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key, required this.contact});
  final Contact contact;

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      ref.read(chatProvider.notifier).resetMessages();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact.name, style: TextStyle(fontSize: 16.sp)),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_rounded, size: 24.sp, color: AppColors.textPrimaryAccent),
        ),
        toolbarHeight: 70.h,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: state.length,
                separatorBuilder: (_, _) => 20.heightBox,
                itemBuilder: (_, i) => MessageBubble(message: state[i]),
              ),
            ),
            const Divider(color: AppColors.textLight, thickness: 1),
            5.heightBox,
            ChatInputField(),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
