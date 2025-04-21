import 'package:flutter/material.dart';

import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/image_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../../../../core/widgets/buttons/small_primary_button.dart';

class OfferedServicesListView extends StatelessWidget {
  const OfferedServicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 6,
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffF6F7F9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
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
                            child: Image.asset(
                              ImageManager.avatar,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'اسم المستخدم',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        '13/10/2024',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      ImageManager.banner,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 120,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('عمل غرفة نوم', style: TextStyleManager.style12BoldBlue),
                  const SizedBox(height: 5),
                  const Text(
                    'مطلوب خدمة مطلوب خدمة مطلوب خدمة مطلوب خدمة مطلوب خدمة مطلوب خدمة...',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SmallPrimaryButton(
                            text: 'شراء',
                            color: ColorManager.secondary,
                            onTap: () {},
                          ),
                          
                          const SizedBox(width: 5),
                         
                          SmallPrimaryButton(
                            text: 'عرض سعر',
                            onTap: () {},
                          ),
                        ],
                      ),
                      Text('500 ج.م',
                          style: TextStyleManager.style12BoldPrimary),
                    ],
                  ),
                ],
              ),
            ));
  }
}
