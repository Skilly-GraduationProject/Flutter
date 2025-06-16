import 'package:flutter/material.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/user_data_form.dart';

class UserDataViewBody extends StatelessWidget {
  const UserDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'بيانات المستخدم',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          Text(
            'برجاء ادخال بياناتك بعنايه',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 20),
          UserDataForm(),
        ],
      ),
    );
  }
}
