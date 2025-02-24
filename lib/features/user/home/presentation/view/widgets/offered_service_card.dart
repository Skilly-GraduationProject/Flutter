import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/home_banners.dart';
import 'package:grad_project/core/widgets/buttons/small_primary_button.dart';
class OfferedServiceCard extends StatelessWidget {
  const OfferedServiceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: ColorManager.whiteShade,
          borderRadius: BorderRadius.circular(12)),
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
              // show details button
              SmallPrimaryButton(
                text: "عرض التفاصيل",
                onTap: () {},
              ),
              //offer price
              Text(
                "500 ج.م",
                style: TextStyleManager.style12BoldPrimary,
              ),
            ],
          )
        ],
      ),
    );
  }
}