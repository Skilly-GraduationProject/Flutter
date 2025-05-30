import 'chat_info_model.dart';

class GetChatsModel {
  String? status;
  List<ChatInfoModel>? chats;

  GetChatsModel({this.status, this.chats});

  factory GetChatsModel.fromJson(Map<String, dynamic> json) => GetChatsModel(
        status: json['status'] as String?,
        chats: (json['data'] as List<dynamic>?)
            ?.map((e) => ChatInfoModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': chats?.map((e) => e.toJson()).toList(),
      };
}
