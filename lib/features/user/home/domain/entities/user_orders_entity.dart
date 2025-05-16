class UserOrdersEntity {
  final String name, desc,id;
  final double price;
  final int offersCount;
  final List<String> images;

  UserOrdersEntity({
    required this.id,
    required this.offersCount,
    required this.name,
    required this.desc,
    required this.price,
    required this.images,

  });
}
