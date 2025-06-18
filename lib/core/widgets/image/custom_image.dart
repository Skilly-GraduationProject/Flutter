
import 'dart:io';
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
    } else if (isFileImage(image)) {
      return getFileImage(imageExtension);
    } else {
      return getAssetImage(imageExtension);
    }
  }

  bool isNetworkImage(String url) {
    return url.startsWith('http://') || url.startsWith('https://');
  }

  bool isFileImage(String path) {
    return File(path).existsSync();
  }

  Widget getAssetImage(String imageExtension) {
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

  Widget getNetworkImage(String imageExtension) {
    return CustomNetworkImage(
      image: image,
      fit: fit,
      height: height,
      width: width,
    );
  }

  Widget getFileImage(String imageExtension) {
    if (imageExtension == 'svg') {
      return SvgPicture.file(
        File(image),
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
      );
    } else {
      return Image.file(
        File(image),
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
      );
    }
  }
}
