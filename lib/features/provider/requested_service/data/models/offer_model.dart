class OfferModel {
  final String id;
  final String userId;
  final String userName;
  final String userImg;
  final double salary;
  final String deliverytime;
  final String notes;
  final String serviceId;
  final String serviceName;
  final String status;

  const OfferModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userImg,
    required this.salary,
    required this.deliverytime,
    required this.notes,
    required this.serviceId,
    required this.serviceName,
    required this.status,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      userName: json['userName'] ?? '',
      userImg: json['userImg'] ?? '',
      salary: (json['salary'] ?? 0.0).toDouble(),
      deliverytime: json['deliverytime'] ?? '',
      notes: json['notes'] ?? '',
      serviceId: json['serviceId'] ?? '',
      serviceName: json['serviceName'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userImg': userImg,
      'salary': salary,
      'deliverytime': deliverytime,
      'notes': notes,
      'serviceId': serviceId,
      'serviceName': serviceName,
      'status': status,
    };
  }
}
