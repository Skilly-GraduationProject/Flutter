import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        if(state.authResponse.userType == "ServiceProvider") {
          print("userType ==${state.authResponse.userType}");
          GoRouter.of(context).pushReplacement(RouterPath.providerHome);
        }else{
        GoRouter.of(context).pushReplacement(RouterPath.userHome);
        }

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
                        GoRouter.of(context).push('/userType');
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
