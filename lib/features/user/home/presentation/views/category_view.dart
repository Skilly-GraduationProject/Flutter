import 'package:flutter/material.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/category_view_body.dart';

class  CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryId, required this.categoryName});
  final String categoryId,categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CategoryViewBody(categoryId: categoryId,categoryName:categoryName ,),
    );
  }
}
