import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../manager/GetAllServices/get_all_services_cubit.dart';
import 'custom_app_bar.dart';
import 'home_services_listview.dart';
import 'sort_icon.dart';

class OfferedServicesViewBody extends StatefulWidget {
  const OfferedServicesViewBody({super.key});

  @override
  State<OfferedServicesViewBody> createState() =>
      _OfferedServicesViewBodyState();
}

class _OfferedServicesViewBodyState extends State<OfferedServicesViewBody> {
  String currentSort = 'nearest';

  @override
  void initState() {
    super.initState();
    context.read<GetAllServicesCubit>().getAllServices(currentSort);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(slivers: [
        const SliverToBoxAdapter(
          child: CustomAppBar(
            title: 'الخدمات المعروضة',
          ),
        ),
        const SliverGap(10),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SortIcon(
                onSelected: (selected) {
                  setState(() {
                    currentSort = selected;
                  });
                  context
                      .read<GetAllServicesCubit>()
                      .getAllServices(currentSort); 
                },
              ),
            ],
          ),
        ),
        const SliverGap(10),
      const  SliverToBoxAdapter(child: HomeServicesListView()),
      ]),
    );
  }
}
