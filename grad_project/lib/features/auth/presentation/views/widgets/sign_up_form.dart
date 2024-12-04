import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../manager/RegisterCubit/register_cubit.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? firstName, secondName, email, password;
  int? phone;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: CustomTextField(
                title: 'الاسم الاخير',
                onSaved: (val) {
                  secondName = val;
                },
              )),
           const   SizedBox(
                width: 20,
              ),
              Expanded(child:
               CustomTextField(
                title: 'الاسم الاول',
                onSaved: (val) {
                  firstName = val;
                },)),
            ],
          ),
         CustomTextField(
          title: 'البريد الالكتروني',
          onSaved: (val) {
                  email = val;
                },),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            title: 'رقم الهاتف',
            icon: Image.asset('assets/images/EG.png'),
            onSaved: (val) {
                  phone = int.tryParse(val!)??0;
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
          CustomButton(
            text: 'انشاء حساب',
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                BlocProvider.of<RegisterCubit>(context).register(
                    firstName!, secondName!, email!, password!, phone!,0);
                GoRouter.of(context).push('/verify');
              }
            },
          ),
        ],
      ),
    );
  }
}
