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
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/features/provider/home/data/models/get_requested_services_model/service.dart';
import 'package:grad_project/features/provider/home/presentation/view/widgets/requested_service_card.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/offered_service_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RequestedServiceCard extends StatelessWidget {
  const RequestedServiceCard({
    super.key,
    this.service,
  });
  final RequestedService? service;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(RouterPath.getServiceView, extra: service!.id);
      },
      child: Container(
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
                        image:
                            service?.images?[0].image ?? ImageManager.avatar))
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // show details button
                // Skeleton.shade(
                //   child: SmallPrimaryButton(
                //     text: "عرض التفاصيل",
                //     onTap: () {

                //     },
                //   ),
                // ),
                Gap(context.responsiveWidth(10)),
                // requested price
                Text(
                  "${service?.price ?? 0} EGP",
                  style: TextStyleManager.style12BoldPrimary,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
