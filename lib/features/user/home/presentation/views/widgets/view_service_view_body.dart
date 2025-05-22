import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/user/home/domain/entities/service_reviews_entity.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/image_banners.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/info_box.dart';
import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../../../../core/navigation/router_path.dart';
import '../../../domain/entities/all_services_entity.dart';
import '../request_service_view.dart';
import 'buy_service_sheet.dart';
import 'custom_app_bar.dart';
import 'price_offer_sheet.dart';

class ViewServiceViewBody extends StatelessWidget {
  const ViewServiceViewBody({super.key, required this.service,});

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
            ImagesBanner(
              images: service.images,
            ),
            const SizedBox(height: 10),
            Text(
              service.name,
              style: TextStyleManager.style16BoldSec,
            ),
            const SizedBox(height: 5),
            Text(
              service.desc,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const Gap(15),
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
                  Text(service.deliveryTime,
                      style: const TextStyle(color: ColorManager.blue)),
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
            InfoBox(
              child: Builder(builder: (context) {
                // final videoUrl = service.video;
                // if (videoUrl != null && videoUrl.isNotEmpty) {
                //   return VideoPlayerWidget(url: videoUrl);
                // } else {
                return const Center(
                  child: Icon(Icons.video_camera_back,
                      size: 50, color: Colors.grey),
                );
              }
                  // },
                  ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'التقييمات',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push(RouterPath.reviewsView, extra: service.id);
                  },
                  child: const Row(
                    children: [
                      Text('عرض الكل'),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // if (firstReview != null)
            //   ReviewCard(
            //     review: review,
            //   )
            // else
            //   const Center(
            //     child: Text(
            //       "No reviews available!",
            //       style: TextStyle(
            //           color: Colors.grey,
            //           fontWeight: FontWeight.w400,
            //           fontSize: 16),
            //     ),
            //   ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.secondary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(32),
                          ),
                        ),
                        isScrollControlled: true,
                        builder: (_) => BuyServiceSheet(
                          service: service,
                        ),
                      );
                    },
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
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(32),
                          ),
                        ),
                        isScrollControlled: true,
                        builder: (_) => PriceOfferSheet(service: service),
                      );
                    },
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
