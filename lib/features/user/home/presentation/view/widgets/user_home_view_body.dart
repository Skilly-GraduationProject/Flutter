import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/home_banners.dart';
import 'package:grad_project/core/widgets/buttons/small_primary_button.dart';
import 'package:grad_project/features/user/home/presentation/view/widgets/categories_list_view.dart';
import 'package:grad_project/features/user/home/presentation/view/widgets/offered_service_card.dart';
import 'package:grad_project/core/widgets/home_app_bar.dart';

class UserHomeViewbody extends StatelessWidget {
  const UserHomeViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          primary: true,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: Image.asset(ImageManager.notificationIcon),
        ),
        const SliverGap(20),
        const SliverToBoxAdapter(
          child: HomeAppBar(),
        ),
        const SliverGap(20),
        const SliverToBoxAdapter(
          child: HomeBanners(),
        ),
        const SliverGap(20),
        SliverToBoxAdapter(
          child: PrimaryButton(
            text: "طلب خدمه",
            onTap: () {},
          ),
        ),
        const SliverGap(20),
        SliverToBoxAdapter(
          child: Text(
            "الاقسام",
            style: TextStyleManager.style18BoldSec,
          ),
        ),
        const SliverGap(10),
        const SliverToBoxAdapter(
          child: CategoriesListView(),
        ),
        const SliverGap(20),
        SliverToBoxAdapter(
          child: Text(
            "الخدمات المعروضه",
            style: TextStyleManager.style18BoldSec,
          ),
        ),
        const SliverGap(10),
        SliverList.separated(
          itemBuilder: (context, index) => const OfferedServiceCard(),
          separatorBuilder: (context, index) {
            return const Gap(15);
          },
        )
      ],
    );
  }
}
