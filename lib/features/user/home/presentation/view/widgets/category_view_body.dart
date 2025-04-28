import 'package:flutter/material.dart';
import 'package:grad_project/features/user/home/presentation/view/widgets/offered_services_list_view.dart';
import 'package:grad_project/features/user/home/presentation/view/widgets/providers_list_view.dart';
import 'category_select_option.dart';
import 'custom_app_bar.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(children: [
          CustomAppBar(title: 'البرمجة'),
          SizedBox(height: 16),
          Expanded(
            child: CategorySelectOption(
              firstTitle: 'موفري الخدمة',
              secondTitle: 'الخدمات المعروضة',
              firstWidget: Expanded(child: ProvidersListView()),
              secondWidget: Expanded(child: OfferedServicesListView()),
            ),
          )
        ]));
  }
}
