import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../manager/LoginCubit/login_cubit.dart';
import 'divider.dart';
import 'google_sign.dart';
import 'sign_in_form.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginSuccess) {
        GoRouter.of(context).push('/user');
      } else if (state is LoginFailure) {
        print(state.error);
      }
    }, builder: (context, state) {
      if (state is LoginLoading) {
        return const CustomLoadingIndicator();
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
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
    });
  }
}
