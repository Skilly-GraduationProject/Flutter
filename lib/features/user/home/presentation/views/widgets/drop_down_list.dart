import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/category_item_entity.dart';
import '../../manager/GetAllCategories/get_all_categories_cubit.dart';
import '../../manager/GetAllCategories/get_all_categories_states.dart';

class DropDownList extends StatefulWidget {
  const DropDownList({super.key});

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllCategoriesCubit>(context).getAllCategories();
  }

  List<CategoryItemEntity> categories = [];
  String? selectedCategory, selectedCategoryId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesStates>(
      builder: (context, state) {
        if (state is GetAllCategoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAllCategoriesSuccess) {
          categories = state.category.categories;

          return DropdownButtonFormField<String>(
              value: selectedCategory,
              hint: const Text("اختر القسم"),
              items: categories.map((cat) {
                return DropdownMenuItem<String>(
                  value: cat.name,
                  child: Text(cat.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                  selectedCategoryId =
                      categories.firstWhere((c) => c.name == value).id;
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                filled: true,
                fillColor: Colors.transparent,
                hintText: "اختر القسم",
              ));
        } else {
          return const Text('فشل تحميل الأقسام');
        }
      },
    );
  }
}
