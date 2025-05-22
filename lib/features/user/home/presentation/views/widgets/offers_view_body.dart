import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'custom_app_bar.dart';
import 'offers_list_view.dart';

class OffersViewBody extends StatelessWidget {
  const OffersViewBody({super.key, required this.orderId});
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverToBoxAdapter(
        child: CustomAppBar(
          title: 'العروض',
        ),
      ),
      const SliverGap(20),
      OffersListView(
        orderId: orderId,
      ),
    ]);
  }
}
