class Review {
  String? providerId;
  String? userName;
  String? userImage;
  String? feedback;
  double? rating;
  String? serserviceName;
  String? serserviceId;

  Review({
    this.providerId,
    this.userName,
    this.userImage,
    this.feedback,
    this.rating,
    this.serserviceName,
    this.serserviceId,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        providerId: json['providerId'] as String?,
        userName: json['userName'] as String?,
        userImage: json['userImage'] as String?,
        feedback: json['feedback'] as String?,
        rating: (json['rating'] as num?)?.toDouble(),
        serserviceName: json['serserviceName'] as String?,
        serserviceId: json['serserviceId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'providerId': providerId,
        'userName': userName,
        'userImage': userImage,
        'feedback': feedback,
        'rating': rating,
        'serserviceName': serserviceName,
        'serserviceId': serserviceId,
      };
}
