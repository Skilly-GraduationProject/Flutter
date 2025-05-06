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
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/service.dart';
import 'package:grad_project/features/provider/profile/presentation/manager/cubit/provider_data_cubit.dart';
import 'package:grad_project/features/provider/profile/presentation/manager/cubit/provider_data_state.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/inherted_profile_widget.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/my_services_card.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/my_services_list.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/my_work_card.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provider_info_widget.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provvider_personal_data.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/review_card.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ServiceProviderProfileViewBody extends StatelessWidget {
  const ServiceProviderProfileViewBody(
      {super.key, required this.providerProfileModel});
  final ProviderProfileModel providerProfileModel;

  @override
  Widget build(BuildContext context) {
    return InhertedProviderProfile(
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
                Text(
                  "تعديل",
                  style: TextStyleManager.style12BoldSec,
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
          const SliverGap(13),
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                IconManager.chat,
                height: context.responsiveHeight(30),
              ),
            ),
          ),
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
                        color: ColorManager.secondary, shape: BoxShape.circle),
                    child: Text(
                      "5",
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
          const SliverGap(20),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "معرض الاعمال",
                        style: TextStyleManager.style16BoldSec,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(RouterPath.myWorkView);
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
          ),
          const SliverGap(20),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: context.responsiveWidth(200) /
                    context.responsiveHeight(250),
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return const MyWorkCard();
              },
            ),
          ),
          const SliverGap(20),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "التقييمات",
                        style: TextStyleManager.style16BoldSec,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(RouterPath.myReviewsView);
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
          ),
          const SliverGap(20),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList.separated(
                itemCount: 3,
                itemBuilder: (context, index) => const ReviewCard(),
                separatorBuilder: (context, index) => const Gap(10)),
          ),
        ],
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
