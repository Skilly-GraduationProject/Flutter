import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'custom_button.dart';
import 'select_option.dart';

class ForgotPassViewBody extends StatelessWidget {
  const ForgotPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
              'نسيت كلمه المرور',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            const Text(
              'قم بادخال رقم الهاتف المرتبط بحسابك',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  ': ارسال الي',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const SelectOption(
              first: 'البريد الالكتروني',
              second: 'رقم الهاتف',
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              text: 'التالي',
              onTap: () => GoRouter.of(context).push('/verifyCode'),
            ),
          ]),
    );
  }
}
