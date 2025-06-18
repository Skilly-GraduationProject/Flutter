class UserOrdersEntity {
  final String name, id, categoryId, startDate, deliveryTime;
  final double price;
  final int offersCount;
  final List<String>? images;
  final String? video, notes, img;

  UserOrdersEntity({
    required this.categoryId,
    required this.deliveryTime,
    required this.startDate,
    required this.id,
    required this.offersCount,
    required this.name,
    required this.price,
    this.img,
    this.images,
    this.video,
    this.notes,
  });
}
