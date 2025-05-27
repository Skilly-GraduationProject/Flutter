import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/shadow_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/buttons/small_primary_button.dart';
import 'package:grad_project/core/widgets/custom_network_image.dart';
import 'package:grad_project/core/widgets/home_banners.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/features/provider/home/data/models/get_requested_services_model/service.dart';
import 'package:grad_project/features/provider/home/presentation/view/widgets/requested_service_card.dart';
import 'package:grad_project/features/user/home/presentation/view/widgets/offered_service_card.dart';
import 'package:grad_project/core/widgets/home_app_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RequestedServiceCard extends StatelessWidget {
  const RequestedServiceCard({
    super.key,
    this.service,
  });
  final RequestedService? service;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [ShadowManager.cardShadow]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: CustomImage(
                      image: service?.userImg ?? ImageManager.avatar,
                      height: context.responsiveHeight(60),
                      width: context.responsiveHeight(60),
                    ),
                  ),
                  const Gap(10),
                  // user name
                  Text(
                    service?.userName ?? "",
                    style: TextStyleManager.style14BoldSec,
                  ),
                ],
              ),
              //post date
              Text(service?.serviceRequestTime ?? "")
            ],
          ),
          const Gap(10),
          //post image
          service!.images!.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CustomNetworkImage(
                      width: context.width,
                      height: context.responsiveHeight(150),
                      image: service?.images?[0].image ?? ImageManager.avatar))
              : const SizedBox.shrink(),
          const Gap(10),
          //post title
          Text(
            service?.name ?? "",
            style: TextStyleManager.style12BoldBlue,
          ),

          const Gap(10),
          //post description
          Offstage(
            offstage: service?.notes == null,
            child: Column(
              children: [
                Text(
                  service?.notes ?? "",
                ),
                const Gap(10),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Text(
                  "العروض",
                  style: TextStyleManager.style12BoldSec,
                ),
                Gap(context.responsiveWidth(10)),
                Skeleton.shade(
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                        color: ColorManager.secondary, shape: BoxShape.circle),
                    child: Text(
                      service?.offerSalaries?.length.toString() ?? "0",
                      style: TextStyleManager.style12BoldWhite,
                    ),
                  ),
                )
              ]),
              Row(
                children: [
                  // show details button
                  Skeleton.shade(
                    child: SmallPrimaryButton(
                      text: "عرض التفاصيل",
                      onTap: () {
                        GoRouter.of(context)
                            .push(RouterPath.getServiceView, extra: service);
                      },
                    ),
                  ),
                  Gap(context.responsiveWidth(10)),
                  // requested price
                  Text(
                    "${service?.price ?? 0} EGP",
                    style: TextStyleManager.style12BoldPrimary,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
