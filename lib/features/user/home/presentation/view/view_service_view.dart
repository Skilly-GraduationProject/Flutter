import 'package:flutter/material.dart';
import 'package:grad_project/features/user/home/presentation/view/widgets/view_service_view_body.dart';

class ViewServiceView extends StatelessWidget {
  const ViewServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body:ViewServiceViewBody (),
    );
  }
}