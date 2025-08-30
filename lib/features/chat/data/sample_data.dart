import 'package:bites/features/chat/domain/message.dart';
import 'package:bites/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

final List<Message> tempMessages = [
  Message(id: 1, content: LocaleKeys.message1.tr(), senderId: 2, receiverId: 1),
  Message(id: 2, content: LocaleKeys.message2.tr(), senderId: 1, receiverId: 2),
  Message(id: 3, content: LocaleKeys.message3.tr(), senderId: 2, receiverId: 1),
];
