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
import 'package:video_player/video_player.dart';

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
                        if (service?.video != null &&
                            service!.video!.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "الفيديو",
                                style: TextStyleManager.style12BoldSec,
                              ),
                              const Gap(10),
                              VideoPlayerWidget(videoUrl: service.video!),
                            ],
                          ),
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

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    super.key,
    required this.videoUrl,
  });

  final String videoUrl;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _videoController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoController();
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  void _initializeVideoController() {
    _videoController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _videoController!.initialize().then((_) {
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    }).catchError((error) {
      print('Error initializing video: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: ColorManager.whiteShade,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            if (_isInitialized && _videoController != null)
              AspectRatio(
                aspectRatio: _videoController!.value.aspectRatio,
                child: VideoPlayer(_videoController!),
              )
            else
              const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primary,
                ),
              ),
            if (_isInitialized && _videoController != null)
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    icon: Icon(
                      _videoController!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_videoController!.value.isPlaying) {
                          _videoController!.pause();
                        } else {
                          _videoController!.play();
                        }
                      });
                    },
                  ),
                ),
              ),
            if (_isInitialized && _videoController != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: VideoProgressIndicator(
                          _videoController!,
                          allowScrubbing: true,
                          colors: const VideoProgressColors(
                            playedColor: ColorManager.primary,
                            bufferedColor: Colors.grey,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                      const Gap(8),
                      ValueListenableBuilder(
                        valueListenable: _videoController!,
                        builder: (context, VideoPlayerValue value, child) {
                          return Text(
                            '${_formatDuration(value.position)} / ${_formatDuration(value.duration)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }
}
