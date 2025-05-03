class AllServicesEntity {
  final String name, desc, img, providerName, time, providerImg;
  final String? notes;
  final double price;
  final List<String> images;

  AllServicesEntity(
      {required this.name,
      required this.desc,
      required this.price,
      required this.img,
      required this.providerName,
      required this.time,
      required this.notes,
      required this.images,
      //required this.deliveryTime,
      required this.providerImg});
}
