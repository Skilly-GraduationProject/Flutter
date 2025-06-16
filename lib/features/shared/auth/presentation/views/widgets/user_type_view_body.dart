import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/user_type_card.dart';

import 'custom_button.dart';

class UserTypeViewBody extends StatefulWidget {
  const UserTypeViewBody({super.key});

  @override
  State<UserTypeViewBody> createState() => _UserTypeViewBodyState();
}

class _UserTypeViewBodyState extends State<UserTypeViewBody> {
  int userType = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/logo.png'),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'اختر نوع الحساب',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const Text(
            'قم باختيار نوع الحساب للإنضمام',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UserTypeCard(
                icon: Icons.work_outline,
                title: 'موفر خدمه',
                description:
                    'موفر الخدمه هو الشخص التي لديه مهاره معينه يقدمها كخدمه للمستخدين',
                isSelected: userType ==1,
                onTap: () {
                  setState(() {
                    userType = 1;
                  });
                },
              ),
              UserTypeCard(
                icon: Icons.person_outlined,
                title: 'مستخدم',
                description:
                    'المستخدم هو الشخص الذي يفحث عن خدمه من التي يقدمها موفري الخدمات',
                isSelected: userType ==0,
                onTap: () {
                  setState(() {
                    userType = 0;
                  });
                },
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
            text: 'التالي',
            onTap: () {
              GoRouter.of(context).push('/signUp', extra: userType);
            },
          )
        ],
      ),
    );
  }
}
