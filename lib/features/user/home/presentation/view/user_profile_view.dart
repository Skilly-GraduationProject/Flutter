import 'package:flutter/material.dart';
import 'package:grad_project/features/user/home/presentation/view/widgets/user_profile_view_body.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
     
      body:UserProfileViewBody() ,
    );
  }
}