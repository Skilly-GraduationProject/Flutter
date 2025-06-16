import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';

import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../../../../core/widgets/buttons/small_primary_button.dart';
import '../../../domain/entities/all_service_offers._entity.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key, required this.offer});
  final AllServiceOffersEntity offer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
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
                      child: Image.network(offer.providerImg,
                          width: context.responsiveWidth(50),
                          height: context.responsiveWidth(50),
                          fit: BoxFit.cover),
                    ),
                    const Gap(10),
                    Text(
                      offer.providerName,
                      style: TextStyleManager.style14BoldSec,
                    ),
                  ],
                ),
                Text('التسليم خلال ${offer.deliveryTime}')
              ],
            ),
            const Gap(10),
            Text(offer.notes),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SmallPrimaryButton(
                      text: 'قبول',
                      onTap: () {},
                    ),
                    const Gap(10),
                    SmallPrimaryButton(
                      text: 'رفض',
                      color: ColorManager.secondary,
                      onTap: () {},
                    ),
                  ],
                ),
                Text(
                  "${offer.price} ج.م",
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
