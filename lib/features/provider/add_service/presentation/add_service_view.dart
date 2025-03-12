import 'package:flutter/material.dart';
import 'package:grad_project/features/provider/add_service/presentation/widgets/add_service_view_body.dart';

class AddServiceView extends StatelessWidget {
  const AddServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SafeArea(child: AddServiceViewBody()),
      ),
    );
  }
}
