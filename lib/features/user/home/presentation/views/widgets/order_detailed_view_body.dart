import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/user_orders_entity.dart';
import '../../manager/GetAllCategories/get_all_categories_cubit.dart';
import '../../manager/GetAllCategories/get_all_categories_states.dart';
import '../request_service_view.dart';
import 'custom_app_bar.dart';
import 'info_box.dart';

class OrderDetailedViewBody extends StatelessWidget {
  const OrderDetailedViewBody({super.key, required this.order});

  final UserOrdersEntity order;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomAppBar(title: 'تفاصيل الطلب'),
        const TitleWidget(title: 'عنوان الطلب'),
        InfoBox(
          child: Text(order.name),
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            TitleWidget(title: "السعر"),
            SizedBox(width: 120),
            TitleWidget(title: 'مدة التسليم'),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: InfoBox(
                child: Text('${order.price}'),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: InfoBox(
                child: Text(order.deliveryTime),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const TitleWidget(title: 'تاريخ البدء'),
        InfoBox(
          child: Text(order.startDate),
        ),
        const SizedBox(height: 10),
        const TitleWidget(title: 'القسم'),
        CategoryNameDisplay(categoryId: order.categoryId),
        const SizedBox(height: 10),
        const TitleWidget(title: "ملاحظات"),
        InfoBox(
          child: Text(order.notes ?? 'لا يوجد ملاحظات'),
        ),
        const SizedBox(height: 10),
        const TitleWidget(title: "الصور"),
        if (order.images != null && order.images!.isNotEmpty)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...order.images!.asMap().entries.map(
                  (entry) {
                    final image = entry.value;
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        else
          const Text('لا توجد صور', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 20),
        const TitleWidget(title: 'الفيديو'),
        if (order.video != null && order.video!.isNotEmpty)
          Container(
            height: 80,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
                child: Icon(Icons.videocam, size: 45, color: Colors.grey)),
          )
        else
          const Text('لا يوجد فيديو', style: TextStyle(color: Colors.grey)),
      ]),
    );
  }
}

class CategoryNameDisplay extends StatelessWidget {
  final String categoryId;

  const CategoryNameDisplay({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesStates>(
      builder: (context, state) {
        if (state is GetAllCategoriesLoading) {
          return const CircularProgressIndicator();
        } else if (state is GetAllCategoriesSuccess) {
          final categories = state.category.categories;

          final category = categories.firstWhere(
            (cat) => cat.id == categoryId,
          );
          return InfoBox(
            child: Text(category.name!),
          );
        } else {
          return const Text('فشل تحميل القسم');
        }
      },
    );
  }
}
