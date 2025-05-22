import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/rate_widget.dart';
import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import 'info_box.dart';

class EmergencyOfferCard extends StatelessWidget {
  final Map<String, dynamic> offer;
  final VoidCallback onReject;
  final VoidCallback onAccept;

  const EmergencyOfferCard({
    super.key,
    required this.offer,
    required this.onReject,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                            backgroundImage: NetworkImage(offer['image']),
                          )),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offer['name'],
                            style: TextStyleManager.style14BoldBlack,
                          ),
                          const Text(
                            'كهربائي',
                          ),
                        ],
                      ),
                    ],
                  ),
                  const RateWidget(),
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
              const Row(
                children: [
                  Expanded(
                      child: InfoBox(
                    child: Text('خلال 20 دقيقه'),
                  )),
                  Gap(20),
                  Expanded(
                      child: InfoBox(
                    child: Text('300 ج.م'),
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
