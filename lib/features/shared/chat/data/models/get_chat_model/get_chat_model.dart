import 'chat_message.dart';

class GetChatModel {
  String? status;
  List<ChatMessage>? chatMessages;

  GetChatModel({this.status, this.chatMessages});

  factory GetChatModel.fromJson(Map<String, dynamic> json) => GetChatModel(
        status: json['status'] as String?,
        chatMessages: (json['data'] as List<dynamic>?)
            ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': chatMessages?.map((e) => e.toJson()).toList(),
      };
}
