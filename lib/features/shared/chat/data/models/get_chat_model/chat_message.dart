class ChatMessage {
  String? id;
  String? chatId;
  String? content;
  String? img;
  DateTime? timestamp;
  bool? isRead;
  String? senderId;
  String? senderName;
  String? senderImg;
  String? receiverId;
  String? receiverName;
  String? receiverImg;
  DateTime? sentAt;

  ChatMessage({
    this.id,
    this.chatId,
    this.content,
    this.img,
    this.timestamp,
    this.isRead,
    this.senderId,
    this.senderName,
    this.senderImg,
    this.receiverId,
    this.receiverName,
    this.receiverImg,
    this.sentAt,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        id: json['id'] as String?,
        chatId: json['chatId'] as String?,
        content: json['content'] as String?,
        img: json['imageUrl'] as String?,
        timestamp: json['timestamp'] == null
            ? null
            : DateTime.parse(json['timestamp'] as String),
        isRead: json['isRead'] as bool?,
        senderId: json['senderId'] as String?,
        senderName: json['senderName'] as String?,
        senderImg: json['senderImg'] as String?,
        receiverId: json['receiverId'] as String?,
        receiverName: json['receiverName'] as String?,
        receiverImg: json['receiverImg'] as String?,
        sentAt: json['sentAt'] == null
            ? null
            : DateTime.parse(json['sentAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'chatId': chatId,
        'content': content,
        'img': img,
        'timestamp': timestamp?.toIso8601String(),
        'isRead': isRead,
        'senderId': senderId,
        'senderName': senderName,
        'senderImg': senderImg,
        'receiverId': receiverId,
        'receiverName': receiverName,
        'receiverImg': receiverImg,
        'sentAt': sentAt?.toIso8601String(),
      };

  /// Factory for a fake loading message
  factory ChatMessage.fakeLoading({
    String? senderId,
  }) {
    return ChatMessage(
      id: 'loading',
      chatId: 'loading_chat',
      content: null,
      img: null,
      timestamp: DateTime.now(),
      isRead: false,
      senderId: senderId ?? 'loading_sender',
      senderName: 'Loading...',
      senderImg: null,
      receiverId: 'loading_receiver',
      receiverName: 'Loading...',
      receiverImg: null,
      sentAt: DateTime.now(),
    );
  }
}
