import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/category_container.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../../domain/entities/category_item_entity.dart';
import '../../manager/GetAllCategories/get_all_categories_cubit.dart';
import '../../manager/GetAllCategories/get_all_categories_states.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllCategoriesCubit>(context).getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesStates>(
        builder: (context, state) {
      if (state is GetAllCategoriesLoading) {
        return const CustomLoadingIndicator();
      } else if (state is GetAllCategoriesSuccess) {
        final categories = state.category.categories;
        return SizedBox(
          height: context.responsiveHeight(80),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            separatorBuilder: (context, index) => const Gap(10),
            itemBuilder: (context, index) {
              final CategoryItemEntity category = categories[index];
             
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push('/category', 
                  extra: {
      'id': category.id,
      'name': category.name,
    },);
                },
                child: CategoryContainer(
                  name: category.name,
                  image: category.img,
                ),
              );
            },
          ),
        );
      } else if (state is GetAllCategoriesFailure) {
        return Text(state.error);
      } else {
        return const Text('unknown');
      }
    });
  }
}
