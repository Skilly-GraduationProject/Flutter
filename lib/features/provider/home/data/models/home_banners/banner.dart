class HomeBanner {
  int? id;
  String? title;
  String? imagePath;
  String? url;

  HomeBanner({this.id, this.title, this.imagePath, this.url});

  factory HomeBanner.fromJson(Map<String, dynamic> json) => HomeBanner(
        id: json['id'] as int?,
        title: json['title'] as String?,
        imagePath: json['imagePath'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'imagePath': imagePath,
        'url': url,
      };
}
