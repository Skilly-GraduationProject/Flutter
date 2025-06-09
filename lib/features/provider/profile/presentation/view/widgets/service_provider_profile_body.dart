import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_secure_storage/test/test_flutter_secure_storage_platform.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/icon_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/shadow_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/core/widgets/custom_error_widget.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';
import 'package:grad_project/features/provider/home/presentation/manager/cubit/provider_home_cubit_cubit.dart';
import 'package:grad_project/features/provider/home/presentation/manager/cubit/provider_home_cubit_state.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/service.dart';
import 'package:grad_project/features/provider/profile/data/models/get_reviews_model/review.dart';
import 'package:grad_project/features/provider/profile/presentation/manager/cubit/provider_data_cubit.dart';
import 'package:grad_project/features/provider/profile/presentation/manager/cubit/provider_data_state.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/inherted_profile_widget.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/my_gallery_section.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/my_reviews_section.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/my_services_card.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/my_services_list.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/my_gallery_card.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provider_info_widget.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provider_personal_data.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/review_card.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ServiceProviderProfileViewBody extends StatelessWidget {
  const ServiceProviderProfileViewBody(
      {super.key, required this.providerProfileModel});
  final ProviderProfileModel providerProfileModel;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
          onRefresh: () async {
            context.read<ProviderDataCubit>().getProviderProfile();
          },
          color: ColorManager.blue,
      child: BlocBuilder<ProviderDataCubit, ProviderDataState>(
        builder: (context, state) {
           ProviderProfileModel  providerProfileModel = state.providerProfile ?? this.providerProfileModel;
          return Skeletonizer(
            enabled: state.getProviderProfileState == CubitState.loading,
            ignorePointers: state.getProviderProfileState == CubitState.loading,
            child: InhertedProviderProfile(
              providerProfileModel: providerProfileModel,
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverAppBar(
                      pinned: true,
                      primary: true,
                      foregroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      leading: const BackIcon(),
                      actions: [
                        GestureDetector(
                          onTap: () {
                            context.push(RouterPath.editProviderProfile,
                                extra: providerProfileModel);
                          },
                          child: Text(
                            "تعديل",
                            style: TextStyleManager.style12BoldSec,
                          ),
                        )
                      ],
                      title: Text(
                        "الحساب الشخصي",
                        style: TextStyleManager.style18BoldSec,
                      ),
                      centerTitle: true,
                    ),
                  ),
                  SliverGap(context.responsiveHeight(40)),
                  const SliverToBoxAdapter(
                    child: ProviderInfoWidget(),
                  ),
                  // const SliverGap(13),
                  // SliverToBoxAdapter(
                  //   child: GestureDetector(
                  //     onTap: () {},
                  //     child: SvgPicture.asset(
                  //       IconManager.chat,
                  //       height: context.responsiveHeight(30),
                  //     ),
                  //   ),
                  // ),
                  const SliverGap(20),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        providerProfileModel.provider!.briefSummary!,
                        style: TextStyleManager.style14RegSec,
                      ),
                    ),
                  ),
                  const SliverGap(20),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "عدد الاعمال المنتهيه",
                            style: TextStyleManager.style16BoldSec,
                          ),
                          Container(
                            padding: const EdgeInsets.all(9),
                            decoration: const BoxDecoration(
                                color: ColorManager.secondary,
                                shape: BoxShape.circle),
                            child: Text(
                              providerProfileModel.provider!.numberOfEndedservices.toString(),
                              style: TextStyleManager.style16BoldWhite,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SliverGap(20),
                  const SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverToBoxAdapter(
                      child: ProviderPersonalData(),
                    ),
                  ),
                  const MyServicesSection(),
                  const MyGallerySection(),
                  const SliverGap(20),
                  const MyReviewsSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: GoRouter.of(context).canPop()
          ? Icon(
              Icons.arrow_circle_right_outlined,
              size: context.responsiveHeight(30),
              color: ColorManager.secondary,
            )
          : const SizedBox.shrink(),
    );
  }
}
