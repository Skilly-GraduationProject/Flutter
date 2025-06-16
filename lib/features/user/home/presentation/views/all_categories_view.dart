import 'package:flutter/material.dart';
import 'widgets/all_categories_view_body.dart';

class AllCategoriesView extends StatelessWidget {
  const AllCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AllCategoriesViewBody(),
    );
  }
}