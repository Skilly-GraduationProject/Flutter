import 'banner.dart';

class HomeBanners {
  List<HomeBanner>? banners;

  HomeBanners({this.banners});

  factory HomeBanners.fromJson(Map<String, dynamic> json) => HomeBanners(
        banners: (json['banners'] as List<dynamic>?)
            ?.map((e) => HomeBanner.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'banners': banners?.map((e) => e.toJson()).toList(),
      };
}
