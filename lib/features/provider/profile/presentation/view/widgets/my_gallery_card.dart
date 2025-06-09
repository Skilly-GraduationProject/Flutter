import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_secure_storage/test/test_flutter_secure_storage_platform.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/icon_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/shadow_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_gallery_model/servicesgallery.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provider_info_widget.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provider_personal_data.dart';

class MyWorkCard extends StatelessWidget {
  const MyWorkCard({
    super.key,
    required this.servicesgallery,
  });
  final Servicesgallery? servicesgallery;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        image: servicesgallery!.images!.first!,
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
        ));
  }
}
