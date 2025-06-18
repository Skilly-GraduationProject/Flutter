import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../manager/GetAllServices/get_all_services_cubit.dart';
import 'custom_app_bar.dart';
import 'home_services_listview.dart';
import 'sort_icon.dart';

class ServicesViewBody extends StatefulWidget {
  const ServicesViewBody({super.key});

  @override
  State<ServicesViewBody> createState() =>
      _ServicesViewBodyState();
}

class _ServicesViewBodyState extends State<ServicesViewBody> {
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
     SliverToBoxAdapter(child: HomeServicesListView(currentSort: currentSort,)),
      ]),
    );
  }
}
