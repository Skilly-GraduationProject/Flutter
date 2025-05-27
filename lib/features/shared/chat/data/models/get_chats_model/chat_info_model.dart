class ChatInfoModel {
  String? id;
  String? firstUserId;
  String? firstUserName;
  String? secondUserId;
  String? secondUserName;
  DateTime? createdAt;
  DateTime? lastUpdatedAt;

  ChatInfoModel({
    this.id,
    this.firstUserId,
    this.firstUserName,
    this.secondUserId,
    this.secondUserName,
    this.createdAt,
    this.lastUpdatedAt,
  });

  factory ChatInfoModel.fromJson(Map<String, dynamic> json) => ChatInfoModel(
        id: json['id'] as String?,
        firstUserId: json['firstUserId'] as String?,
        firstUserName: json['firstUserName'] as String?,
        secondUserId: json['secondUserId'] as String?,
        secondUserName: json['secondUserName'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        lastUpdatedAt: json['lastUpdatedAt'] == null
            ? null
            : DateTime.parse(json['lastUpdatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstUserId': firstUserId,
        'firstUserName': firstUserName,
        'secondUserId': secondUserId,
        'secondUserName': secondUserName,
        'createdAt': createdAt?.toIso8601String(),
        'lastUpdatedAt': lastUpdatedAt?.toIso8601String(),
      };
}
