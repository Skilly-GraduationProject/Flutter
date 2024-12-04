import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/constants.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/sign_in_form.dart';
import 'divider.dart';
import 'google_sign.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.05,
              ),
              Center(
                child: Image.asset('assets/images/logo.png'),
              ),
              const Text(
                'تسجيل الدخول',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              const Text(
                'قم بتسجيل الدخول للإنضمام ',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              const SignInForm(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push('/signUp');
                    },
                    child: const Text(
                      'سجل',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: kPrimaryColor),
                    ),
                  ),
                  const Text(
                    ' ليس لديك حساب؟',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const DividerWidget(),
              const SizedBox(height: 20),
              const GoogleSign()
            ]),
      ),
    );
  }
}
