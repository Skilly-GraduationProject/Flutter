class AllServicesEntity {
  final String name,id, desc, img, providerName, time, providerImg,deliveryTime;
  final String? notes;
  final double price ;
  final List<String> images;
  final String? video;

  AllServicesEntity({
    required this.name,
    required this.desc,
    required this.price,
    required this.id,
    required this.img,
    required this.providerName,
    required this.time,
    required this.notes,
    required this.images,
    required this.providerImg,
    required this.deliveryTime,
    required this.video,
  });
}
