class Review {
  String? providerId;
  String? userName;
  String? userImage;
  String? feedback;
  double? rating;
  String? serviceName;
  String? serviceId;

  Review({
    this.providerId,
    this.userName,
    this.userImage,
    this.feedback,
    this.rating,
    this.serviceName,
    this.serviceId,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        providerId: json['providerId'] as String?,
        userName: json['userName'] as String?,
        userImage: json['userImage'] as String?,
        feedback: json['feedback'] as String?,
        rating: (json['rating'] as num?)?.toDouble(),
        serviceName: json['serviceName'] as String?,
        serviceId: json['serviceId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'providerId': providerId,
        'userName': userName,
        'userImage': userImage,
        'feedback': feedback,
        'rating': rating,
        'serserviceName': serviceName,
        'serserviceId': serviceId,
      };
}
