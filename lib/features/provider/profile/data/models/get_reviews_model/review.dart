class Review {
  String? providerId;
  String? userName;
  String? userImage;
  String? feedback;
  double? rating;

  Review({
    this.providerId,
    this.userName,
    this.userImage,
    this.feedback,
    this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        providerId: json['providerId'] as String?,
        userName: json['userName'] as String?,
        userImage: json['userImage'] as String?,
        feedback: json['feedback'] as String?,
        rating: (json['rating'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'providerId': providerId,
        'userName': userName,
        'userImage': userImage,
        'feedback': feedback,
        'rating': rating,
      };
}
