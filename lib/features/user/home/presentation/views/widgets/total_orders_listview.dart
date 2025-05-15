import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helper/loading_indicator.dart';
import '../../../domain/entities/user_orders_entity.dart';
import '../../manager/GetUserOrders/get_user_orders_cubit.dart';
import '../../manager/GetUserOrders/get_user_orders_states.dart';
import 'total_order_card.dart';

class TotalOrdersListview extends StatefulWidget {
  const TotalOrdersListview({super.key});

  @override
  State<TotalOrdersListview> createState() => _TotalOrdersListviewState();
}

class _TotalOrdersListviewState extends State<TotalOrdersListview> {
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
        return const CustomLoadingIndicator();
      } else if (state is GetUserOrdersSuccess) {
        final orders = state.orders;
        return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: orders.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
              final UserOrdersEntity order = orders[index];
              return TotalOrderCard(
                order: order,
              );
            });
      } else if (state is GetUserOrdersFailure) {
        return Text(state.error);
      } else {
        return const Text('unknown');
      }
    });
  }
}
