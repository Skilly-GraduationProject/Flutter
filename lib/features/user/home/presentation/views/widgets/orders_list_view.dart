import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helper/empty_widget.dart';
import '../../../../../../core/helper/loading_indicator.dart';
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
        return const SliverToBoxAdapter(child: CustomLoadingIndicator());
      } else if (state is GetUserOrdersSuccess) {
        final orders = state.orders;

        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: orders.map((order) {
                return SizedBox(
                  width: (MediaQuery.of(context).size.width) / 2.3,
                  child: OrderCard(
                    id: order.id,
                    offersCount: order.offersCount,
                    desc: order.desc,
                    img: (order.images != null &&
                            order.images!.any((e) => e.trim().isNotEmpty))
                        ? order.images!.firstWhere((e) => e.trim().isNotEmpty,
                            orElse: () => '')
                        : null,
                    name: order.name,
                    price: order.price,
                  ),
                );
              }).toList(),
            ),
          ),
        );
      } else if (state is GetUserOrdersFailure) {
        return SliverToBoxAdapter(child: Text(state.error));
      } else if (state is GetUserOrdersEmpty) {
        return const SliverToBoxAdapter(
            child: EmptyWidget(
          text: 'Orders',
        ));
      } else {
        return const SliverToBoxAdapter(child: Text('unknown'));
      }
    });
  }
}
