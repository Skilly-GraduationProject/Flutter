import 'package:flutter/material.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/order_detailed_view_body.dart';

import '../../domain/entities/user_orders_entity.dart';

class OrderDetialedView extends StatelessWidget {
  const OrderDetialedView({super.key, required this.order});
  
  final UserOrdersEntity order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrderDetailedViewBody(order: order,),
    );
  }
}