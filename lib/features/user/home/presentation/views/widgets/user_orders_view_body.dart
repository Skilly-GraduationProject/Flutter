import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'custom_app_bar.dart';
import 'total_orders_listview.dart';

class UserOrdersViewBody extends StatelessWidget {
  const UserOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: CustomAppBar(
          title: 'الطلبات',
        ),
      ),
      SliverGap(20),
      SliverToBoxAdapter(
        child: TotalOrdersListview(),
      ),
    ]);
  }
}
