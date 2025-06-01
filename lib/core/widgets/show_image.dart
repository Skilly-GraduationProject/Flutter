import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

showImage(
    {required BuildContext context,
    required String image,
    bool isImageFile = false}) {
  showGeneralDialog(
    context: context,
    barrierColor: Colors.transparent,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    pageBuilder: (context, animation1, animation2) => GestureDetector(
      onVerticalDragUpdate: (details) {
        // // Adjust the sensitivity here if needed
        // if (details.delta.dy > 10) {
        //   context.pop();
        // }
      },
      child: Stack(
        children: [
          SizedBox(
            width: context.width,
            child: PhotoView(
              backgroundDecoration: const BoxDecoration(
                color: Colors.black54,
              ),
              imageProvider: isImageFile
                  ? FileImage(File(image))
                  : NetworkImage(image, scale: 1) as ImageProvider,
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered,
              initialScale: PhotoViewComputedScale.contained,
              enableRotation: false,
              basePosition: Alignment.center,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close_rounded,
                      color: Colors.white, size: 30)),
            ),
          )
        ],
      ),
    ),
  );
}

showMultiImages(
    {required BuildContext context,
    required List<String> images,
    bool isImageFile = false}) {
  showGeneralDialog(
    context: context,
    barrierColor: Colors.transparent,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    pageBuilder: (context, animation1, animation2) => GestureDetector(
      onVerticalDragUpdate: (details) {
        // // Adjust the sensitivity here if needed
        // if (details.delta.dy > 10) {
        //   context.pop();
        // }
      },
      child: Stack(
        children: [
          SizedBox(
            width: context.width,
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(images[index]),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered,
                  initialScale: PhotoViewComputedScale.contained,
                  basePosition: Alignment.center,
                  heroAttributes: PhotoViewHeroAttributes(tag: images[index]),
                );
              },
              itemCount: images.length,
              loadingBuilder: (context, event) => Container(
                width: context.width,
                height: context.height,
                color: Colors.black54,
                child: Center(
                  child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            event.expectedTotalBytes!.toInt(),
                  ),
                ),
              ),
              backgroundDecoration: const BoxDecoration(
                color: Colors.black54,
              ),

              // pageController: widget.pageController,
              // onPageChanged: onPageChanged,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close_rounded,
                      color: Colors.white, size: 30)),
            ),
          )
        ],
      ),
    ),
  );
}
