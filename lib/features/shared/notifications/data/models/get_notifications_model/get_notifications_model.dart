import 'notification.dart';

class GetNotificationsModel {
  String? status;
  List<NotificationModel>? notifications;

  GetNotificationsModel({this.status, this.notifications});

  factory GetNotificationsModel.fromJson(Map<String, dynamic> json) {
    return GetNotificationsModel(
      status: json['status'] as String?,
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'notifications': notifications?.map((e) => e.toJson()).toList(),
      };
}
