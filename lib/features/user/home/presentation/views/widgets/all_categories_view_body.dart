import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/all_categories_list_view.dart';

class AllCategoriesViewBody extends StatelessWidget {
  const AllCategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                ),
                SizedBox(
                  width: context.responsiveWidth(15),
                ),
                Text(
                  'كافة الخدمات الاحترافية التي تحتاجها',
                  style: TextStyleManager.style14BoldPrimary,
                ),
              ],
            ),
            const Gap(20),
            const AllCategoriesListView(),
          ],
        ),
      ),
    );
  }
}
