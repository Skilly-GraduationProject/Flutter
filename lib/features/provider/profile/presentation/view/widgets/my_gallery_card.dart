import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/shadow_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_gallery_model/servicesgallery.dart';

class MyGalleryCard extends StatelessWidget {
  const MyGalleryCard({
    super.key,
    required this.servicesgallery,
  });
  final GalleryService? servicesgallery;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(RouterPath.providerGalleryServiceView,
            extra: servicesgallery!.id);
      },
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [ShadowManager.cardShadow]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              servicesgallery!.images!.isEmpty
                  ? Container()
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CustomImage(
                          image: servicesgallery?.images?.first["img"] ?? "",
                          width: context.width,
                          height: context.responsiveHeight(100),
                          fit: BoxFit.cover)),
              const Gap(15),
              Text(
                servicesgallery!.galleryName!,
                style: TextStyleManager.style14BoldSec,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(8),
              Text(
                servicesgallery!.description!,
                style: TextStyleManager.style14RegSec,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
    );
  }
}
