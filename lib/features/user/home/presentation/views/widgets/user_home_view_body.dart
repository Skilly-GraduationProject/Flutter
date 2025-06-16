import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/categories_list_view.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/home_services_listview.dart';

import '../../../../../../core/navigation/router_path.dart';
import '../../../../../../core/widgets/buttons/small_primary_button.dart';
import 'clickable_banners.dart';
import 'home_user_app_bar.dart';

class UserHomeViewBody extends StatelessWidget {
  const UserHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: HomeUserAppBar(),
        ),
        const SliverGap(10),
        const SliverToBoxAdapter(
          child: ClickableBanners(),
        ),
        const SliverGap(15),
        SliverToBoxAdapter(
          child: PrimaryButton(
            text: "طلب خدمه",
            onTap: () {
              GoRouter.of(context).push('/requestService');
            },
          ),
        ),
        const SliverGap(15),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "الاقسام",
              style: TextStyleManager.style18BoldSec,
            ),
          ),
        ),
        const SliverGap(10),
        const SliverToBoxAdapter(
          child: CategoriesListView(),
        ),
        const SliverGap(10),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallPrimaryButton(
                text: 'استعراض جميع الخدمات',
                onTap: () {
                  GoRouter.of(context).push(RouterPath.allCategoriesView);
                },
              ),
            ],
          ),
        ),
        const SliverGap(15),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الخدمات المعروضه",
                  style: TextStyleManager.style18BoldSec,
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(RouterPath.offeredServicesView);
                  },
                  child: const Row(
                    children: [
                      Text('عرض الكل'),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
