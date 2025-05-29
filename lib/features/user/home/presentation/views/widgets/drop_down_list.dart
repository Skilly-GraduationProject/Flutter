import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../domain/entities/category_item_entity.dart';
import '../../manager/GetAllCategories/get_all_categories_cubit.dart';
import '../../manager/GetAllCategories/get_all_categories_states.dart';

class DropDownList extends StatefulWidget {
  const DropDownList({super.key, this.onCategorySelected, required this.hint});
  final void Function(String)? onCategorySelected;
  final String hint;

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
            decoration: InputDecoration(
              hintText: selectedCategory == null ? widget.hint : null,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              filled: true,
              fillColor: const Color(0xffF6F7F9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              suffixIcon: const Icon(Icons.keyboard_arrow_down),
            ),
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

              if (widget.onCategorySelected != null) {
                widget.onCategorySelected!(selectedCategoryId!);
              }
            },
            iconSize: 0,
            style: TextStyleManager.style14BoldBlack,
            dropdownColor: Colors.white,
          );
        } else {
          return const Text('فشل تحميل الأقسام');
        }
      },
    );
  }
}
