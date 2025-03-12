import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/shadow_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/buttons/small_primary_button.dart';
import 'package:grad_project/core/widgets/home_banners.dart';
import 'package:grad_project/features/provider/home/presentation/view/widgets/requested_service_card.dart';
import 'package:grad_project/features/user/home/presentation/view/widgets/offered_service_card.dart';
import 'package:grad_project/core/widgets/home_app_bar.dart';

class RequestedServiceCard extends StatelessWidget {
  const RequestedServiceCard({
    super.key,
  });

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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(ImageManager.avatar),
                  ),
                  const Gap(10),
                  // user name
                  Text(
                    "محمد خالد",
                    style: TextStyleManager.style14BoldSec,
                  ),
                ],
              ),
              //post date
              const Text("13/10/2024")
            ],
          ),
          const Gap(10),
          //post image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              ImageManager.banner,
              width: context.width,
              fit: BoxFit.fill,
            ),
          ),
          const Gap(10),
          //post title
          Text(
            "عمل غرفه نوم",
            style: TextStyleManager.style12BoldBlue,
          ),

          const Gap(10),
          //post description
          const Text(
              "مطلوب خدمه  مطلوب خدمه  مطلوب خدمه  مطلوب خدمه  مطلوب خدمه  مطلوب خدمه  مطلوب خدمه  مطلوب خدمه  مطلوب......"),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Text(
                  "العروض",
                  style: TextStyleManager.style12BoldSec,
                ),
                Gap(context.responsiveWidth(10)),
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                      color: ColorManager.secondary, shape: BoxShape.circle),
                  child: Text(
                    "5",
                    style: TextStyleManager.style12BoldWhite,
                  ),
                )
              ]),
              Row(
                children: [
                  // show details button
                  SmallPrimaryButton(
                    text: "عرض التفاصيل",
                    onTap: () {},
                  ),
                  Gap(context.responsiveWidth(10)),
                  // requested price
                  Text(
                    "500 ج.م",
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
