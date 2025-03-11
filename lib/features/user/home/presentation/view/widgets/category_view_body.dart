import 'package:flutter/material.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/select_option.dart';
import 'package:grad_project/features/user/home/presentation/view/widgets/offered_service_card.dart';
import 'package:grad_project/features/user/home/presentation/view/widgets/offered_services_list_view.dart';
import 'package:grad_project/features/user/home/presentation/view/widgets/providers_list_view.dart';
import '../../../../../../core/managers/image_manager.dart';
import 'custom_app_bar.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          const CustomAppBar(title: 'البرمجة'),
          const SizedBox(height: 16),
          Expanded(
            child: SelectOption(options: const [
              'موفري الخدمة',
              'الخدمات المعروضة'
            ], optionWidgets: {
              'موفري الخدمة': Expanded(
                child: ProvidersListView(),
              ),
              'الخدمات المعروضة': Expanded(child: OfferedServicesListView())
            }, onSaved: (selectedOption, input) {}),
          )
        ]));
  }
}
