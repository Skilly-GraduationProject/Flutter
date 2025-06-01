import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/core/widgets/buttons/notification_button.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/buttons/small_primary_button.dart';
import 'package:grad_project/core/widgets/custom_error_widget.dart';
import 'package:grad_project/core/widgets/home_banners.dart';
import 'package:grad_project/features/provider/home/data/models/get_requested_services_model/service.dart';
import 'package:grad_project/features/provider/home/data/repo/home_repo.dart';
import 'package:grad_project/features/provider/home/presentation/manager/cubit/provider_home_cubit_cubit.dart';
import 'package:grad_project/features/provider/home/presentation/manager/cubit/provider_home_cubit_state.dart';
import 'package:grad_project/features/provider/home/presentation/view/widgets/provider_home_data.dart';
import 'package:grad_project/features/provider/home/presentation/view/widgets/requested_service_card.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/offered_service_card.dart';
import 'package:grad_project/core/widgets/home_app_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ServiceProviderViewBody extends StatelessWidget {
  const ServiceProviderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (context) {
        return CustomScrollView(
          slivers: [
            const SliverGap(20),
            // Provider date in home
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: ProviderHomeData(),
              ),
            ),
            const SliverGap(20),
            // home banners
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: BlocBuilder<ProviderHomeCubit, ProviderHomeCubitState>(
                  bloc: context.read<ProviderHomeCubit>()..getHomeBanners(),
                  buildWhen: (previous, current) =>
                      previous.getHomeBannersState !=
                      current.getHomeBannersState,
                  builder: (context, state) {
                    if (state.getHomeBannersState == CubitState.failure) {
                      return const CustomErrorWidget();
                    } else {
                      return Skeletonizer(
                        enabled:
                            state.getHomeBannersState == CubitState.loading,
                        child: HomeBanners(
                          banners: state.homeBanners,
                        ),
                      );
                    }
                  },
                ).animate().scaleXY(),
              ),
            ),
            const SliverGap(20),
            // add service button
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: PrimaryButton(
                  text: "اضافه خدمه",
                  onTap: () {
                    GoRouter.of(context).push(RouterPath.addServiceView);
                  },
                ).animate().scaleXY(delay: const Duration(milliseconds: 100)),
              ),
            ),
            const SliverGap(20),
            // ==== requested services from users ===
            //title
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "الخدمات المطلوبه",
                  style: TextStyleManager.style18BoldSec,
                ).animate().scaleXY(delay: const Duration(milliseconds: 200)),
              ),
            ),
            const SliverGap(20),
            // requested services l
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: BlocBuilder<ProviderHomeCubit, ProviderHomeCubitState>(
                bloc: context.read<ProviderHomeCubit>()..getRequestedServices(),
                buildWhen: (previous, current) =>
                    previous.getRequestedServicesState !=
                    current.getRequestedServicesState,
                builder: (context, state) {
                  if (state.getRequestedServicesState == CubitState.failure) {
                    return const SliverToBoxAdapter(
                      child: CustomErrorWidget(),
                    );
                  } else {
                    bool isLoading =
                        state.getRequestedServicesState == CubitState.loading;
                    return SliverList.separated(
                      itemCount:
                          isLoading ? 10 : state.requestedServices.length,
                      itemBuilder: (context, index) => Skeletonizer(
                        enabled: isLoading,
                        child: RequestedServiceCard(
                                service: isLoading
                                    ? RequestedService()
                                    : state.requestedServices[index])
                            .animate()
                            .scaleXY(
                                delay:
                                    Duration(milliseconds: (index * 50) + 200)),
                      ),
                      separatorBuilder: (context, index) => const Gap(15),
                    );
                  }
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
