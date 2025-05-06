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
import 'package:grad_project/features/provider/home/presentation/view/widgets/service_provider_view_body.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/service.dart';
import 'package:grad_project/features/provider/profile/presentation/manager/cubit/provider_data_cubit.dart';
import 'package:grad_project/features/provider/profile/presentation/manager/cubit/provider_data_state.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/inherted_profile_widget.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/my_services_card.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/my_work_card.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provider_info_widget.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provvider_personal_data.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/review_card.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliver_tools/sliver_tools.dart';

class MyServicesSection extends StatelessWidget {
  const MyServicesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderDataCubit, ProviderDataState>(
      bloc: context.read<ProviderDataCubit>()..getMyServices(),
      builder: (context, state) {
        List<ProviderService>? myServices =
            state.getMyServicesModel?.service ?? [];
        if (state.getMyServicesState == CubitState.failure) {
          return SliverToBoxAdapter(
            child: const CustomErrorWidget(),
          );
        }else{
          return SliverSkeletonizer(
          enabled: state.getMyServicesState == CubitState.loading,
          child: MultiSliver(
            children: [
              const SliverGap(20),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "خدماتي",
                            style: TextStyleManager.style16BoldSec,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push(
                                  RouterPath.myServicesView,
                                  extra: myServices);
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
                  itemCount: myServices.length >= 2 ? 2 : myServices.length,
                  itemBuilder: (context, index) {
                    return MyServicesCard(
                      service: myServices[index],
                    );
                  },
                ),
              ),
            ],
          ),
        );
        }
      },
    );
  }
}
