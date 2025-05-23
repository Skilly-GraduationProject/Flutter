class AllServiceOffersEntity {
  final String id, notes, providerName,providerImg,deliveryTime;
  final double price ;


 AllServiceOffersEntity({
    required this.notes,
    required this.price,
    required this.id,
    required this.providerName,
    required this.providerImg,
    required this.deliveryTime,
  });
}
