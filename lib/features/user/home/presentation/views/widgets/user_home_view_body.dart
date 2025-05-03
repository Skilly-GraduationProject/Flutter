import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/home_banners.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/categories_list_view.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/home_services_listview.dart';

import 'home_user_app_bar.dart';

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
        ),
        const SliverToBoxAdapter(
          child: HomeUserAppBar(),
        ),
        const SliverGap(20),
        const SliverToBoxAdapter(
          child: ImagesBanner(
            images: [],
          ),
        ),
        const SliverGap(20),
        SliverToBoxAdapter(
          child: PrimaryButton(
            text: "طلب خدمه",
            onTap: () {
              GoRouter.of(context).push('/requestService');
            },
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
        const SliverToBoxAdapter(
          child: SizedBox(height: 600, child: HomeServicesListView()),
        )
      ],
    );
  }
}
