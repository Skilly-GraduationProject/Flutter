import 'package:flutter/material.dart';

import 'widgets/user_data_view_body.dart';

class UserDataView extends StatelessWidget {
  const UserDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const UserDataViewBody(),
    );
  }
}