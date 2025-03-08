import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import '../../../../../../constants.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? password, phone;
  bool? remember;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            title: 'رقم الهاتف',
            icon: Image.asset(
              'assets/images/EG.png',
            ),
            onSaved: (val) {
              phone = val;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            title: 'الرقم السري',
            icon: Image.asset('assets/images/Hide.png'),
            onSaved: (val) {
              password = val;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => GoRouter.of(context).push('/forgotPass'),
                child: const Text(
                  'هل نسيت كلمه المرور؟',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Row(
                children: [
                  const Text(
                    'تذكرني',
                    style: TextStyle(
                        color: Color(0xff6C757D),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            text: 'تسجيل الدخول',
            onTap: () {
              GoRouter.of(context).push(RouterPath.userHome);

              // if (formKey.currentState!.validate()) {
              //   formKey.currentState!.save();
              //   BlocProvider.of<LoginCubit>(context)
              //       .login(phone!, password!, true);
              // }
            },
          )
        ],
      ),
    );
  }
}
