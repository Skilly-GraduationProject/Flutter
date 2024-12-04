import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class ResetPassViewBody extends StatefulWidget {
  const ResetPassViewBody({super.key});

  @override
  State<ResetPassViewBody> createState() => _ResetPassViewBodyState();
}

class _ResetPassViewBodyState extends State<ResetPassViewBody> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  String? pass, confirmPass;
  bool errorMessage = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/logo.png'),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'تغيير كلمه المرور',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const Text(
            'قم بتغيير كلمه المرور بكلمه مرور جديده',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
            key: key,
            child: Column(
              children: [
                CustomTextField(
                  obsecure: true,
                  controller: password,
                  title: 'كلمه المرور الجديده',
                  onSaved: (val) {
                    pass = val;
                  },
                  // onChanged: (val) {
                  //   setState(() {});
                  // },
                  validator: (val) {
                    if (val == null || val.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  icon: Image.asset('assets/images/Hide.png'),
                  obsecure: true,
                  controller: confirmPassword,
                  title: ' تاكيد كلمه المرور الجديده',
                  onSaved: (val) {
                    confirmPass = val;
                  },
                  // onChanged: (val) {
                  //   setState(() {});
                  // },
                  validator: (val) {
                    if (val == null || val != password.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
            text: 'حفظ',
            onTap: () {
              if (key.currentState!.validate()) {
                key.currentState!.save();
                // final email =
                //     ModalRoute.of(context)?.settings.arguments as String;
                GoRouter.of(context).push('/signIn');
              }
            },
          )
        ],
      ),
    );
  }
}
