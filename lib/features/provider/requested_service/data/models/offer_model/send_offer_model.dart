class SendOfferModel {
  final String serviceId;
  final String notes;
  final double salary;
  final String deliveryTime;

  SendOfferModel({
    required this.serviceId,
    required this.notes,
    required this.salary,
    required this.deliveryTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'serviceId': serviceId,
      'notes': notes,
      'salary': salary,
      'deliverytime': deliveryTime,
    };
  }

  factory SendOfferModel.fromJson(Map<String, dynamic> json) {
    return SendOfferModel(
      serviceId: json['serviceId'] ?? '',
      notes: json['notes'] ?? '',
      salary: (json['salary'] ?? 0.0).toDouble(),
      deliveryTime: json['deliverytime'] ?? '',
    );
  }
}
