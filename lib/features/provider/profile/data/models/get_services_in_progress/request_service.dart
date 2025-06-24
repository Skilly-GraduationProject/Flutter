class RequestService {
  String? id;
  String? serviceRequestTime;
  String? name;
  double? price;
  String? deliverytime;
  String? startDate;
  String? categoryId;
  dynamic categoryName;
  String? notes;
  String? userId;
  String? userName;
  String? userImg;
  List<dynamic>? images;
  String? video;
  int? offersCount;
  int? distance;

  RequestService({
    this.id,
    this.serviceRequestTime,
    this.name,
    this.price,
    this.deliverytime,
    this.startDate,
    this.categoryId,
    this.categoryName,
    this.notes,
    this.userId,
    this.userName,
    this.userImg,
    this.images,
    this.video,
    this.offersCount,
    this.distance,
  });

  factory RequestService.fromJson(Map<String, dynamic> json) {
    return RequestService(
      id: json['id'] as String?,
      serviceRequestTime: json['serviceRequestTime'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      deliverytime: json['deliverytime'] as String?,
      startDate: json['startDate'] as String?,
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as dynamic,
      notes: json['notes'] as String?,
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      userImg: json['userImg'] as String?,
      images: json['images'] as List<dynamic>?,
      video: json['video'] as String?,
      offersCount: json['offersCount'] as int?,
      distance: json['distance'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'serviceRequestTime': serviceRequestTime,
        'name': name,
        'price': price,
        'deliverytime': deliverytime,
        'startDate': startDate,
        'categoryId': categoryId,
        'categoryName': categoryName,
        'notes': notes,
        'userId': userId,
        'userName': userName,
        'userImg': userImg,
        'images': images,
        'video': video,
        'offersCount': offersCount,
        'distance': distance,
      };
}
