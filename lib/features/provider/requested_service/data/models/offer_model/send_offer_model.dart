class SendOfferModel {
  final String serviceId;
  final String notes;
  final double salary;
  final String deliveryTime;

  SendOfferModel(
      {required this.serviceId,
      required this.notes,
      required this.salary,
      required this.deliveryTime});

  Map<String, dynamic> toJson() {
    return {
      'serviceId': serviceId,
      'notes': notes,
      'salary': salary,
      'deliverytime': deliveryTime,
    };
  }
}
