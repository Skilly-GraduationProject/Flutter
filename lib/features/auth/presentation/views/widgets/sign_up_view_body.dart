import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/auth/presentation/views/widgets/sign_up_form.dart';
import '../../../../../constants.dart';
import '../../../../../core/helper/loading_indicator.dart';
import '../../manager/RegisterCubit/register_cubit.dart';
import 'divider.dart';
import 'google_sign.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});
  String? email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is RegisterSuccess) {
        GoRouter.of(context).push('/verify', extra: email ?? '');
      } else if (state is RegisterFailure) {
        print(state.error);
      }
    }, builder: (context, state) {
      if (state is RegisterLoading) {
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
                  height: 70,
                ),
                Center(
                  child: Image.asset('assets/images/logo.png'),
                ),
                const Text(
                  'انشاء حساب',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                const Text(
                  'قم بانشاء حساب جديد للإنضمام',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20,
                ),
                SignUpForm(
                  emailSaved: (val) {
                    email = val;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push('/signIn');
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
                      ' لديك حساب بالفعل؟',
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
