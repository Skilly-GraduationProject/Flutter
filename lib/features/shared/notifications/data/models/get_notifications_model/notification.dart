class NotificationModel {
  String? id;
  String? userId;
  dynamic userImg;
  String? title;
  String? body;
  bool? isRead;
  String? createdAt;

  NotificationModel({
    this.id,
    this.userId,
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
        userImg: json['userImg'] as dynamic,
        title: json['title'] as String?,
        body: json['body'] as String?,
        isRead: json['isRead'] as bool?,
        createdAt: json['createdAt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'userImg': userImg,
        'title': title,
        'body': body,
        'isRead': isRead,
        'createdAt': createdAt,
      };
}
