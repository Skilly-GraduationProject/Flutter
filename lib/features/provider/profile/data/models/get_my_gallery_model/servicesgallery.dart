class Servicesgallery {
  String? id;
  String? galleryName;
  String? description;
  String? deliverytime;
  String? img;
  String? serviceProviderId;
  List<dynamic>? images;

  Servicesgallery({
    this.id,
    this.galleryName,
    this.description,
    this.deliverytime,
    this.img,
    this.serviceProviderId,
    this.images,
  });

  factory Servicesgallery.fromJson(Map<String, dynamic> json) {
    return Servicesgallery(
      id: json['id'] as String?,
      galleryName: json['galleryName'] as String?,
      description: json['description'] as String?,
      deliverytime: json['deliverytime'] as String?,
      img: json['img'] as String?,
      serviceProviderId: json['serviceProviderId'] as String?,
      images: json['images'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'galleryName': galleryName,
        'description': description,
        'deliverytime': deliverytime,
        'img': img,
        'serviceProviderId': serviceProviderId,
        'images': images,
      };
}
