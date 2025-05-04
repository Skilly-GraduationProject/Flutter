class OfferedServicesEntity {
  final String name, desc, img,providerName, date, providerImg;
  final double price;


  OfferedServicesEntity({
    required this.name,
    required this.desc,
    required this.price,
    required this.img,
    required this.providerImg,
    required this.providerName,
    required this.date,
  });
}
