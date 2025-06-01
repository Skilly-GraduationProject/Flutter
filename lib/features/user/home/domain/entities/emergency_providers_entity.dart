class EmergencyProvidersEntity {
  final String name, img, rate, profession, providerId, requestId,deliveryTime;
  final double price;

  EmergencyProvidersEntity({
    required this.requestId,
    required this.providerId,
    required this.name,
    required this.price,
    required this.img,
    required this.rate,
       required this.profession,
    required this.deliveryTime,
  });
}
