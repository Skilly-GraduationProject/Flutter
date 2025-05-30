import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/rate_widget.dart';
import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../domain/entities/emergency_providers_entity.dart';
import 'info_box.dart';

class EmergencyOfferCard extends StatelessWidget {
  final EmergencyProvidersEntity offer;
  final VoidCallback onReject;
  final VoidCallback onAccept;

  const EmergencyOfferCard({
    super.key,
    required this.onReject,
    required this.onAccept,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(offer.img),
                          )),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offer.name,
                            style: TextStyleManager.style14BoldBlack,
                          ),
                          Text(
                            offer.profession,
                          ),
                        ],
                      ),
                    ],
                  ),
                  RateWidget(
                    rate: offer.rate,
                  ),
                ],
              ),
              const Gap(20),
              Row(
                children: [
                  Text('وقت الوصول المتوقع',
                      style: TextStyleManager.style14BoldBlack),
                  const Gap(30),
                  Text('السعر', style: TextStyleManager.style14BoldBlack),
                ],
              ),
              const Gap(5),
              Row(
                children: [
                  Expanded(
                      child: InfoBox(
                    child: Text(formatDeliveryTime(offer.deliveryTime)),
                  )),
                  const Gap(20),
                  Expanded(
                      child: InfoBox(
                    child: Text('${offer.price} ج.م'),
                  )),
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onAccept,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary,
                      ),
                      child: Text(
                        'قبول',
                        style: TextStyleManager.style12BoldWhite,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onReject,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.secondary,
                      ),
                      child: Text(
                        'رفض',
                        style: TextStyleManager.style12BoldWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String formatDeliveryTime(String input) {
  final hourMatch = RegExp(r'(\d+)\s*ساعة').firstMatch(input);
  final minuteMatch = RegExp(r'(\d+)\s*دقيقة').firstMatch(input);

  final hours = hourMatch != null ? '${hourMatch.group(1)} ساعة' : '';
  final minutes = minuteMatch != null ? '${minuteMatch.group(1)} دقيقة' : '';

  return '$hours $minutes'.trim();
}
