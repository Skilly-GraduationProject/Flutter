import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/image_banners.dart';
import 'package:grad_project/features/provider/home/presentation/view/widgets/requested_service_card.dart';
import 'package:grad_project/core/widgets/home_provider_app_bar.dart';

class ServiceProviderViewBody extends StatelessWidget {
  const ServiceProviderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

        const SliverGap(20),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(RouterPath.providerProfile);
                },
                child: const HomeProviderAppBar(),)
          ),
        ),
        const SliverGap(20),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: ImagesBanner(images: [],),
          ),
        ),
        const SliverGap(20),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: PrimaryButton(
              text: "اضافه خدمه",
              onTap: () {
                GoRouter.of(context).push(RouterPath.addServiceView);
              },
            ),
          ),
        ),
        const SliverGap(20),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: Text(
              "الخدمات المطلوبه",
              style: TextStyleManager.style18BoldSec,
            ),
          ),
        ),
        const SliverGap(20),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList.separated(
            itemCount: 10,
            itemBuilder: (context, index) => const RequestedServiceCard(),
            separatorBuilder: (context, index) => const Gap(15),
          ),
        )
      ],
    );
  }
}
