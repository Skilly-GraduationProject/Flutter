class EmergencyProvidersEntity {
  final String name, img, rate, profession, id, deliveryTime;
  final double price;

  EmergencyProvidersEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.img,
    required this.rate,
       required this.profession,
    required this.deliveryTime,
  });
}
