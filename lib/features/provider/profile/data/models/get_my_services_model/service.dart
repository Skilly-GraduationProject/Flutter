class ProviderService {
  String? id;
  String? serviceRequestTime;
  String? name;
  String? description;
  double? price;
  String? deliverytime;
  String? notes;
  String? serviceProviderId;
  String? serviceProviderName;
  String? providerImg;
  List<dynamic>? images;
  String? categoryId;

  ProviderService({
    this.id,
    this.serviceRequestTime,
    this.name,
    this.description,
    this.price,
    this.deliverytime,
    this.notes,
    this.serviceProviderId,
    this.serviceProviderName,
    this.providerImg,
    this.images,
    this.categoryId,
  });

  factory ProviderService.fromJson(Map<String, dynamic> json) =>
      ProviderService(
        id: json['id'] as String?,
        serviceRequestTime: json['serviceRequestTime'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        price: json['price'] as double?,
        deliverytime: json['deliverytime'] as String?,
        notes: json['notes'] as String?,
        serviceProviderId: json['serviceProviderId'] as String?,
        serviceProviderName: json['serviceProviderName'] as String?,
        providerImg: json['providerImg'] as String?,
        images: json['images'] as List<dynamic>?,
        categoryId: json['categoryId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'serviceRequestTime': serviceRequestTime,
        'name': name,
        'description': description,
        'price': price,
        'deliverytime': deliverytime,
        'notes': notes,
        'serviceProviderId': serviceProviderId,
        'serviceProviderName': serviceProviderName,
        'providerImg': providerImg,
        'images': images,
        'categoryId': categoryId,
      };
}
