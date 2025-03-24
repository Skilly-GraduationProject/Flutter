import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
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
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
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
                  Text(
                    "محمد خالد",
                    style: TextStyleManager.style14BoldSec,
                  ),
                ],
              ),
              const Text("13/10/2024")
            ],
          ),
          const Gap(10),
          Text(
            "عمل غرفه نوم",
            style: TextStyleManager.style12BoldBlue,
          ),
          const Gap(10),
          const Text(
              "مطلوب خدمه  مطلوب خدمه  مطلوب خدمه  مطلوب خدمه  مطلوب خدمه  مطلوب خدمه  مطلوب خدمه  مطلوب خدمه  مطلوب......"),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallPrimaryButton(
                text: "عرض التفاصيل",
                onTap: () {
                  GoRouter.of(context).push('/viewService');
                },
              ),
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
