import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'custom_app_bar.dart';
import 'home_services_listview.dart';

class OfferedServicesViewBody extends StatelessWidget {
  const OfferedServicesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: CustomAppBar(
            title: 'الخدمات المعروضة',
          ),
        ),
        SliverGap(10),
        SliverToBoxAdapter(child: HomeServicesListView()),
      ]),
    );
  }
}
