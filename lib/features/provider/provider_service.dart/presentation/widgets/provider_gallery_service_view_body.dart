import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/buttons/secondary_button.dart';
import 'package:grad_project/core/widgets/custom_error_widget.dart';
import 'package:grad_project/core/widgets/show_custom_loading.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_gallery_model/servicesgallery.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/service.dart';
import 'package:grad_project/features/provider/profile/data/models/get_reviews_model/review.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/review_card.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/manager/cubit/provider_service_cubit.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/manager/cubit/provider_service_state.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/data_column.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/data_row.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/image_slider.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/send_offer_dialog.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ProviderGalleryServiceViewBody extends StatelessWidget {
  const ProviderGalleryServiceViewBody({super.key, required this.serviceId});
  final String serviceId;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorManager.primary,
      onRefresh: () async {
        context.read<ProviderServiceCubit>().getGalleryService(serviceId);
      },
      child: BlocConsumer<ProviderServiceCubit, ProviderServiceState>(
        listener: (context, state) {
          if (state.deleteServiceState == CubitState.loading) {
            showCustomLoading(context);
          } else if (state.deleteServiceState == CubitState.success) {
            GoRouter.of(context).pop(context);
            GoRouter.of(context).pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("تم حذف الخدمه بنجاح")),
            );
          } else if (state.deleteServiceState == CubitState.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("حدث خطأ أثناء حذف الخدمه")),
            );
          }
        },
        builder: (context, state) {
          if (state.getGalleyServiceState == CubitState.failure) {
            return const Center(child: CustomErrorWidget());
          } else {
            GalleryService? service = state.galleryService;
            return Skeletonizer(
              enabled: state.getGalleyServiceState == CubitState.loading,
              ignorePointers: state.getGalleyServiceState == CubitState.loading,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomScrollView(slivers: [
                  const SliverGap(20),
                  // service images slider
                  SliverToBoxAdapter(
                    child: ImageSlider(
                      images: service?.images ?? [],
                    ),
                  ),
                  const SliverGap(20),
                  // service data
                  SliverToBoxAdapter(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // service title
                          Text(
                            service?.galleryName ?? "",
                            style: TextStyleManager.style20BoldSec,
                          ),
                          const Gap(15),
                          // service description
                          Text(
                            service?.description ?? "",
                            style: TextStyleManager.style12RegSec,
                          ),
                        ]),
                  ),
                  const SliverGap(30),
                  // service data
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // service price
                        // ServiceDataRow(
                        //   title: "سعر الخدمه",
                        //   value: "${service?.price} ج.م",
                        // ),
                        // const Gap(20),
                        // service delivery time
                        ServiceDataRow(
                          title: "مده التسليم",
                          value: "${service?.deliverytime} ايام",
                        ),
                        const Gap(20),
                        // service details
                        ServiceDataColumn(
                          title: 'وصف الخدمه',
                          value: service?.description ?? "",
                        ),
                        const Gap(20),
                        // service video (if exists) (optional)
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       "الفيديو",
                        //       style: TextStyleManager.style12BoldSec,
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  // ReviewsSection(reviews: service?.reviews),
                  const SliverGap(20),
                  // service options buttons
                  SliverToBoxAdapter(
                    child: Skeleton.ignore(
                      child: Row(
                        children: [
                          // chat button
                          Expanded(
                              child: SecondaryButton(
                                  color: Colors.red,
                                  text: "حذف",
                                  onTap: () {
                                    context
                                        .read<ProviderServiceCubit>()
                                        .deleteGalleryService(serviceId);
                                  })),
                          // const Gap(20),
                          // send offer button
                          // Expanded(
                          //     child: PrimaryButton(
                          //         text: "تعديل",
                          //         onTap: () {
                          //           context.push(RouterPath.editServiceView,
                          //               extra: service);
                          //         })),
                        ],
                      ),
                    ),
                  ),
                  const SliverGap(20),
                ]),
              ),
            );
          }
        },
      ),
    );
  }
}

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({
    super.key,
    required this.reviews,
  });

  final List<Review?>? reviews;

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const SliverGap(20),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "التقييمات",
                    style: TextStyleManager.style16BoldSec,
                  ),
                  const Spacer(),
                  (reviews == null || reviews!.isEmpty)
                      ? Text(
                          "لا يوجد تقييمات",
                          style: TextStyleManager.style14RegSec,
                        )
                      : GestureDetector(
                          onTap: () {
                            GoRouter.of(context)
                                .push(RouterPath.myReviewsView, extra: reviews);
                          },
                          child: Row(
                            children: [
                              Text(
                                "عرض الكل",
                                style: TextStyleManager.style14RegSec,
                              ),
                              const Gap(3),
                              const Icon(
                                Icons.arrow_forward_outlined,
                                color: ColorManager.secondary,
                              )
                            ],
                          ),
                        )
                ],
              ),
            ],
          ),
        ),
        const SliverGap(20),
        SliverList.separated(
          itemCount: reviews?.length ?? 0,
          separatorBuilder: (context, index) => const Gap(10),
          itemBuilder: (context, index) {
            Review reviewModel = reviews![index]!;
            return ReviewCard(
              review: reviews?[index] ?? Review(),
            );
          },
        ),
      ],
    );
  }
}
