import 'package:flutter/material.dart';
import 'package:grad_project/features/auth/presentation/views/widgets/user_type_view_body.dart';

class UserTypeView extends StatelessWidget {
  const UserTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UserTypeViewBody(),
    );
  }
}