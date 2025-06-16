import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'discount_services_list_view.dart';

class DiscountServicesViewBody extends StatelessWidget {
  const DiscountServicesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: CustomAppBar(
          title: 'الخدمات',
        ),
      ),
      DiscountServicesListView(),
    ]);
  }
}
