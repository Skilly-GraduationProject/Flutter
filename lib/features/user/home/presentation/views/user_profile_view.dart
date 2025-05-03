import 'package:flutter/material.dart';
import 'package:grad_project/features/user/home/domain/entities/user_profile_data_entity.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/user_profile_view_body.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key, required this.data});
  final UserProfileDataEntity data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      body:UserProfileViewBody(data:data,) ,
    );
  }
}