import 'package:bites/features/chat/data/sample_data.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../domain/message.dart';

final chatProvider = StateNotifierProvider<ChatNotifier, List<Message>>((ref) {
  return ChatNotifier();
});

class ChatNotifier extends StateNotifier<List<Message>> {
  ChatNotifier() : super(tempMessages);

  void addMessage(Message message) {
    state = [...state, message];
  }

  void resetMessages() {
    state = tempMessages;
  }
}
