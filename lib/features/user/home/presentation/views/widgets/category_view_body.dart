import 'package:flutter/material.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/offered_services_list_view.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/providers_list_view.dart';
import 'category_select_option.dart';
import 'custom_app_bar.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key, required this.categoryId, required this.categoryName});
  final String categoryId,categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(children: [
          CustomAppBar(title: 'البرمجة'),
         const SizedBox(height: 16),
          Expanded(
            child: CategorySelectOption(
              firstTitle: 'موفري الخدمة',
              secondTitle: 'الخدمات المعروضة',
              firstWidget: Expanded(
                  child: ProvidersListView(
                categoryId:'40f5f9df-a11b-4a90-b89c-2bd01b33c420',
              )),
              secondWidget: Expanded(child: OfferedServicesListView(
                categoryId: '40f5f9df-a11b-4a90-b89c-2bd01b33c420',
              )),
            ),
          )
        ]));
  }
}
