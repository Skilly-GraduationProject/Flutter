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
import 'package:grad_project/features/provider/profile/data/models/get_services_in_progress/request_service.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provider_info_widget.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provider_personal_data.dart';

class InProgressServiceCard extends StatelessWidget {
  const InProgressServiceCard({
    super.key,
    required this.requestService,
  });
  final RequestService? requestService;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(RouterPath.inProgressServiceView, extra: requestService!);
      },
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [ShadowManager.cardShadow]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              requestService!.images!.isEmpty
                  ? Container()
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CustomImage(
                          image: requestService?.images?.first["img"] ?? "",
                          width: context.width,
                          height: context.responsiveHeight(100),
                          fit: BoxFit.cover)),
              const Gap(15),
              Text(
                requestService!.name!,
                style: TextStyleManager.style14BoldSec,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(8),
              Text(
                requestService!.notes!,
                style: TextStyleManager.style14RegSec,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
    );
  }
}
