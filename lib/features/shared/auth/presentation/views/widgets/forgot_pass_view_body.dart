import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/shared/auth/presentation/manager/ForgetpassCubit/forgetPass_cubit.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import 'custom_text_field.dart';
import 'select_option.dart';

class ForgotPassViewBody extends StatefulWidget {
  ForgotPassViewBody({super.key});

  @override
  State<ForgotPassViewBody> createState() => _ForgotPassViewBodyState();
}

class _ForgotPassViewBodyState extends State<ForgotPassViewBody> {
  String? enteredInput;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPassCubit, ForgetPassState>(
        listener: (context, state) {
      if (state is ForgetPassSuccess) {
        GoRouter.of(context).push(
          '/verifyCode',
          extra: {'email': enteredInput ?? ''},
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
                mainAxisAlignment: MainAxisAlignment.start,
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
              // SelectOption(
              //     first: 'البريد الالكتروني',
              //     second: 'رقم الهاتف',
              //     onSaved: (selectedOption, input) {
              // enteredInput = input;
              // if (selectedOption == 'email') {
              //   BlocProvider.of<ForgetPassCubit>(context)
              //       .forgetPass(email: input);
              //       }
              //     }),
              SelectOption(
                  options: const [
                    'البريد الالكتروني',
                    'رقم الهاتف'
                  ],
                  optionWidgets: {
                    'البريد الالكتروني': CustomTextField(
                      title: 'البريد الالكتروني',
                      onSaved: (val) {
                        setState(() {
                           enteredInput = val;
                        print(enteredInput);                        
                                                });
                       
                      },
                    ),
                    'رقم الهاتف': CustomTextField(
                      title: 'رقم الهاتف',
                      icon: Image.asset('assets/images/EG.png'),
                      onSaved: (val) {
                        enteredInput = val;
                      },
                    ),
                  },
                  onSaved: (selectedOption, input) {
                    setState(() {
                      enteredInput = input;
                    });

                    print(enteredInput);
                    print(input);
                    if (selectedOption == 'البريد الالكتروني') {
                      BlocProvider.of<ForgetPassCubit>(context)
                          .forgetPass(email: enteredInput!);
                    }
                  })
            ]),
      );
    });
  }
}
