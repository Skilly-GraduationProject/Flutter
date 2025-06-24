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
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/service.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provider_info_widget.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provider_personal_data.dart';

class MyServicesCard extends StatelessWidget {
  const MyServicesCard({
    super.key,
    required this.service,
  });
  final ProviderService service;
  @override
  Widget build(BuildContext context) {
    String firstImage = (service.images != null &&
            service.images!.isNotEmpty &&
            service.images!.first.image!.isNotEmpty)
        ? service.images!.first.image!
        : ImageManager.banner;
    return GestureDetector(
      onTap: () {
        context.push(RouterPath.providerServiceView, extra: service.id);
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
              Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CustomImage(
                      image: firstImage,
                      width: context.width,
                      fit: BoxFit.cover,
                    )),
              ),
              const Gap(15),
              Text(
                service.name ?? "",
                style: TextStyleManager.style14BoldSec,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(8),
              Text(
                service.description ?? "",
                style: TextStyleManager.style14RegSec,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.push(RouterPath.serviceOffersScreen,
                          extra: service.id);
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: ColorManager.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          service.countOfOffers?.toString() ?? "0",
                          style: TextStyleManager.style12BoldWhite,
                        )),
                  ),
                  const Gap(8),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Text(
                      "${service.price} ج.م",
                      style: TextStyleManager.style12BoldPrimary,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
