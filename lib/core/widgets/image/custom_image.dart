// shared Network image widget
// usd CachedNetworkImage package
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/widgets/custom_network_image.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
    this.fit,
    this.height,
    this.width,
  });
  final String image;
  final BoxFit? fit;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    final imageExtension = image.split('.').last.toLowerCase();
    if (isNetworkImage(image)) {
      return getNetworkImage(imageExtension);
    } else {
      return getAssetImage(imageExtension);
    }
  }

  bool isNetworkImage(String url) {
    return url.startsWith('http://') || url.startsWith('https://');
  }

  getAssetImage(String imageExtension) {
    if (imageExtension == 'svg') {
      return SvgPicture.asset(
        image,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
      );
    } else {
      return Image.asset(
        image,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
      );
    }
  }

  getNetworkImage(String imageExtension) {
    return CustomNetworkImage(
        image: image, fit: fit, height: height, width: width);
  }
}
