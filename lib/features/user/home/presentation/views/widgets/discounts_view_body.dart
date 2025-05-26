import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';

import '../../../../../../core/navigation/router_path.dart';
import 'discount_services_list_view.dart';
import 'points_info_container.dart';

class DiscountsViewBody extends StatelessWidget {
  const DiscountsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      'اهلا اسم المستخدم',
                      style: TextStyleManager.style16BoldBlack,
                    )
                  ],
                ),
                const Gap(20),
                const PointsInfoContainer(),
                const Gap(20),
              ]))),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'اشتري الان',
                style: TextStyleManager.style16BoldBlack,
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    RouterPath.discountServicesView,
                  );
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
      const DiscountServicesListView()
    ]);
  }
}
