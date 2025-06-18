import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/review_card.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../domain/entities/all_services_entity.dart';
import '../../manager/GetReviews/get_service_reviews_cubit.dart';
import '../../manager/GetReviews/get_service_reviews_states.dart';
import '../request_service_view.dart';
import 'custom_app_bar.dart';
import 'image_banners.dart';
import 'info_box.dart';

class ViewServiceDetailsForm extends StatefulWidget {
  const ViewServiceDetailsForm({super.key, required this.service});
  final AllServicesEntity service;

  @override
  State<ViewServiceDetailsForm> createState() => _ViewServiceDetailsFormState();
}

class _ViewServiceDetailsFormState extends State<ViewServiceDetailsForm> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetServiceReviewsCubit>(context)
        .getServiceReviews(widget.service.id);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(title: 'الخدمة'),
          ImagesBanner(images: widget.service.images),
          const SizedBox(height: 10),
          Text(widget.service.name, style: TextStyleManager.style16BoldBlack),
          const SizedBox(height: 5),
          Text(widget.service.desc,
              style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const Gap(15),
          const TitleWidget(title: 'سعر الخدمة'),
          InfoBox(
              child: Text('${widget.service.price} ج م',
                  style: const TextStyle(color: ColorManager.blue))),
          const TitleWidget(title: 'مدة التسليم'),
          InfoBox(
              child: Text(widget.service.deliveryTime,
                  style: const TextStyle(color: ColorManager.blue))),
          const TitleWidget(title: 'ملاحظات'),
          InfoBox(child: Text(widget.service.notes ?? '')),
          const TitleWidget(title: 'فيديو'),
          const InfoBox(
            child: Center(
              child:
                  Icon(Icons.video_camera_back, size: 50, color: Colors.grey),
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('التقييمات',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(RouterPath.reviewsView, extra: widget.service.id);
                },
                child: const Row(
                  children: [
                    Text('عرض الكل'),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward, size: 16),
                  ],
                ),
              ),
            ],
          ),
          BlocBuilder<GetServiceReviewsCubit, GetServiceReviewsStates>(
            builder: (context, state) {
              if (state is GetServiceReviewsLoading) {
                return const CustomLoadingIndicator();
              } else if (state is GetServiceReviewsSuccess) {
                final firstReview = state.reviews[0];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReviewCard(review: firstReview),
                );
              } else if (state is GetServiceReviewsEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "لا توجد تقييمات حالياً",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                );
              } else if (state is GetServiceReviewsFailure) {
                return Center(
                  child: Text(
                    state.error,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return const Text('unknown');
              }
            },
          ),
        ],
      ),
    );
  }
}
