import 'package:flutter/material.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key, required this.paymentUrl});
  final String paymentUrl;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: PaymentViewBody(paymentUrl: paymentUrl,));
  }
}
