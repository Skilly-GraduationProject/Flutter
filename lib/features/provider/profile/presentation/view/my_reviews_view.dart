import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';

class MyReviewsView extends StatelessWidget {
  const MyReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  title: Text(
                    "التقييمات",
                    style: TextStyleManager.style20BoldSec,
                  ),
                  centerTitle: true,
                ),
              ),
              const SliverGap(20),
              SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList.separated(
                    itemCount: 20,
                    itemBuilder: (context, index) => const ReviewCard(),
                    separatorBuilder: (context, index) => const Gap(10)),
              ),
            ],
          )),
    );
  }
}
