class ChatInfoModel {
  String? id;
  String? firstUserId;
  String? firstUserName;
  String? firstUserImg;
  String? secondUserId;
  String? secondUserName;
  DateTime? createdAt;
  DateTime? lastUpdatedAt;
  String? secondUserImg;
  String? lastMessage;

  ChatInfoModel({
    this.id,
    this.firstUserId,
    this.firstUserName,
    this.firstUserImg,
    this.secondUserId,
    this.secondUserName,
    this.createdAt,
    this.lastUpdatedAt,
    this.secondUserImg,
    this.lastMessage,
  });

  factory ChatInfoModel.fromJson(Map<String, dynamic> json) => ChatInfoModel(
        id: json['id'] as String?,
        firstUserId: json['firstUserId'] as String?,
        firstUserName: json['firstUserName'] as String?,
        firstUserImg: json['firstUserImg'] as String?,
        secondUserId: json['secondUserId'] as String?,
        secondUserName: json['secondUserName'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        lastUpdatedAt: json['lastUpdatedAt'] == null
            ? null
            : DateTime.parse(json['lastUpdatedAt'] as String),
        secondUserImg: json['secondUserImg'] as String?,
        lastMessage: json['lastMessage'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstUserId': firstUserId,
        'firstUserName': firstUserName,
        'firstUserImg': firstUserImg,
        'secondUserId': secondUserId,
        'secondUserName': secondUserName,
        'createdAt': createdAt?.toIso8601String(),
        'lastUpdatedAt': lastUpdatedAt?.toIso8601String(),
        'secondUserImg': secondUserImg,
        'lastMessage': lastMessage,
      };
}
