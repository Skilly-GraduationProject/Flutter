import 'package:flutter/material.dart';

import 'widgets/user_orders_view_body.dart';

class UserOrdersView extends StatelessWidget {
  const UserOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UserOrdersViewBody(),
    );
  }
}
