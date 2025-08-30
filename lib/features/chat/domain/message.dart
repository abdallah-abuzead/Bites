class Message {
  final int? id;
  final String content;
  final int senderId;
  final String senderName;
  final int receiverId;
  final String receiverName;
  final bool showInteractions;
  final DateTime? timestamp;

  Message({
    this.id,
    required this.content,
    required this.senderId,
    this.senderName = '',
    required this.receiverId,
    this.receiverName = '',
    this.showInteractions = false,
    this.timestamp,
  });
}
