import 'package:flutter/material.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/user_home_view_body.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: UserHomeViewbody(),
        ),
      ),
    );
  }
}
