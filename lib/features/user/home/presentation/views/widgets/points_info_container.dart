import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';

import '../../../../../../core/managers/image_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../domain/entities/user_profile_data_entity.dart';

class PointsInfoContainer extends StatelessWidget {
  const PointsInfoContainer({super.key, required this.data});

  final UserProfileDataEntity data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border.all(color: Colors.grey.shade300, width: 2),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('النقاط الحالية',
                      style: TextStyleManager.style16BoldBlack),
                  const Gap(5),
                  Text('${data.points}',
                      style: TextStyleManager.style28BoldAmber),
                  const Gap(10),
                  Text(
                    'معاك ${data.points} نقطة؟\nاستخدمهم دلوقتي واحصل على خصم %15 من الخدمة!',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Image.asset(
              ImageManager.trophy,
              height: context.responsiveHeight(130),
              width: context.responsiveHeight(130),
            ),
          ],
        ),
      ),
    );
  }
}
