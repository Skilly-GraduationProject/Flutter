import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../../domain/entities/user_orders_entity.dart';
import '../../manager/GetUserOrders/get_user_orders_cubit.dart';
import '../../manager/GetUserOrders/get_user_orders_states.dart';
import 'order_card.dart';

class OrdersListView extends StatefulWidget {
  const OrdersListView({super.key});

  @override
  State<OrdersListView> createState() => _OrdersListViewState();
}

class _OrdersListViewState extends State<OrdersListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserOrdersCubit>(context).getUserOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserOrdersCubit, GetUserOrdersStates>(
        builder: (context, state) {
      if (state is GetUserOrdersLoading) {
        return const SliverToBoxAdapter(child:CustomLoadingIndicator());
      } else if (state is GetUserOrdersSuccess) {
        final orders = state.orders;

        return SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(childCount: orders.length,
                  (context, index) {
                final UserOrdersEntity order = orders[index];
                return OrderCard(
                  desc: order.desc,
                  img: order.images.first??'',
                  name: order.name,
                  price: order.price,
                );
              }),
            ));
      } else if (state is GetUserOrdersFailure) {
        return SliverToBoxAdapter(child: Text(state.error));
      } else {
        return const SliverToBoxAdapter(child: Text('unknown'));
      }
    });
  }
}
