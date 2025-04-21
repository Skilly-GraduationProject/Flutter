import 'package:flutter/material.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/info_box.dart';

import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../../../../core/widgets/home_banners.dart';
import '../request_service_view.dart';
import 'custom_app_bar.dart';

class ViewServiceViewBody extends StatelessWidget {
  const ViewServiceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(title: 'الخدمة'),
            const SizedBox(height: 16),
            const HomeBanners(),
            const SizedBox(height: 10),
            Text(
              'عنوان الخدمه',
              style: TextStyleManager.style18BoldSec,
            ),
            const SizedBox(height: 5),
            const Text(
              ' وصف للخدمة تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleWidget(title: 'تقييم الخدمة'),
                Row(
                  children: List.generate(
                    5,
                    (index) => const Icon(Icons.star, color: Colors.amber),
                  ),
                ),
              ],
            ),
       
            const InfoBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('سعر الخدمة',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('1000 ج م', style: TextStyle(color: ColorManager.blue)),
                ],
              ),
            ),
            const InfoBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('مدة التسليم',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('5 أيام', style: TextStyle(color: ColorManager.blue)),
                ],
              ),
            ),
            const InfoBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ملاحظات',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('- ملاحظة 1\n- ملاحظة 2\n- ملاحظة 3'),
                ],
              ),
            ),
            const TitleWidget(title: 'فيديو'),
            const InfoBox(
              child: Center(
                child:
                    Icon(Icons.video_camera_back, size: 50, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.secondary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {},
                    child: const Text('شراء',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {},
                    child: const Text('عرض سعر',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
