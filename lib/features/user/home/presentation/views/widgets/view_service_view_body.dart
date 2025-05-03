
import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/home_banners.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/info_box.dart';
import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../domain/entities/all_services_entity.dart';
import '../request_service_view.dart';
import 'custom_app_bar.dart';

class ViewServiceViewBody extends StatelessWidget {
  const ViewServiceViewBody({super.key, required this.service});

  final AllServicesEntity service;

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
            ImagesBanner(images: service.images,),
            const SizedBox(height: 10),
            Text(
              service.name,
              style: TextStyleManager.style18BoldSec,
            ),
            const SizedBox(height: 5),
            Text(
              service.desc,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
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
            InfoBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('سعر الخدمة',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('${service.price} ج م',
                      style: const TextStyle(color: ColorManager.blue)),
                ],
              ),
            ),
            InfoBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('مدة التسليم',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  //   Text(service.deliveryTime, style:const TextStyle(color: ColorManager.blue)),
                ],
              ),
            ),
            InfoBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('ملاحظات',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(service.notes ?? ''),
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

