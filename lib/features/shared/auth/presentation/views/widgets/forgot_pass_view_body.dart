import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/shared/auth/presentation/manager/ForgetpassCubit/forgetPass_cubit.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class ForgotPassViewBody extends StatefulWidget {
  const ForgotPassViewBody({super.key});

  @override
  State<ForgotPassViewBody> createState() => _ForgotPassViewBodyState();
}

class _ForgotPassViewBodyState extends State<ForgotPassViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPassCubit, ForgetPassState>(
        listener: (context, state) {
      if (state is ForgetPassSuccess) {
        GoRouter.of(context).push(
          '/verifyCode',
          extra: {'email': email ?? ''},
        );
      } else if (state is ForgetPassFailure) {
        print(state.error);
      }
    }, builder: (context, state) {
      if (state is ForgetPassLoading) {
        return const CustomLoadingIndicator();
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: formKey,
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
                  'قم بادخال البريد الالكتروني المرتبط بحسابك',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      ': ارسال الي',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    title: 'البريد الالكتروني',
                    onSaved: (val) {
                      email = val;
                    }),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  text: 'التالي',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      BlocProvider.of<ForgetPassCubit>(context)
                          .forgetPass(email: email!);
                    }
                  },
                ),
              ]),
        ),
      );
    });
  }
}
