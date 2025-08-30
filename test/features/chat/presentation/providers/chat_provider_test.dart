import 'package:bites/features/chat/data/sample_data.dart';
import 'package:bites/features/chat/domain/message.dart';
import 'package:bites/features/chat/presentation/providers/chat_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ProviderContainer container;
  late ChatNotifier notifier;

  setUp(() {
    container = ProviderContainer();
    notifier = container.read(chatProvider.notifier);
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state is tempMessages', () {
    final messages = container.read(chatProvider);
    expect(messages, tempMessages);
  });

  test('addMessage adds a message to the state', () {
    final newMessage = Message(content: 'test', senderId: 1, receiverId: 2);
    notifier.addMessage(newMessage);

    final messages = container.read(chatProvider);
    expect(messages, [...tempMessages, newMessage]);
  });

  test('resetMessages resets state to tempMessages', () {
    final newMessage = Message(content: 'test', senderId: 1, receiverId: 2);
    notifier.addMessage(newMessage);

    // State now has extra message
    expect(container.read(chatProvider), [...tempMessages, newMessage]);

    notifier.resetMessages();

    // State reset to initial messages
    expect(container.read(chatProvider), tempMessages);
  });
}
