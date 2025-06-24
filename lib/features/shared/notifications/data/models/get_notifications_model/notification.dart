class NotificationModel {
  String? id;
  String? userId;
  String? serviceId;
  String? userImg;
  String? title;
  String? body;
  bool? isRead;
  String? createdAt;

  NotificationModel({
    this.id,
    this.userId,
    this.serviceId,
    this.userImg,
    this.title,
    this.body,
    this.isRead,
    this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json['id'] as String?,
        userId: json['userId'] as String?,
        serviceId: json['serviceId'] as String?,
        userImg: json['userImg'] as String?,
        title: json['title'] as String?,
        body: json['body'] as String?,
        isRead: json['isRead'] as bool?,
        createdAt: json['createdAt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'serviceId': serviceId,
        'userImg': userImg,
        'title': title,
        'body': body,
        'isRead': isRead,
        'createdAt': createdAt,
      };
}
