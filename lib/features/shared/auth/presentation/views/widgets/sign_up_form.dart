import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../manager/RegisterCubit/register_cubit.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm(
      {super.key,
      required this.emailSaved,
      required this.phoneSaved,
      required this.userType});
  final Function(String) emailSaved;
  final Function(String) phoneSaved;
  final int userType;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? firstName, secondName, email, password, phone;

  @override
  Widget build(BuildContext context) {

      return Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: CustomTextField(
                  title: 'الاسم الاول',
                  onSaved: (val) {
                    firstName = val;
                  },
                )),
                const Gap(10),
                Expanded(
                    child: CustomTextField(
                  title: 'الاسم الاخير',
                  onSaved: (val) {
                    secondName = val;
                  },
                )),
              ],
            ),
            CustomTextField(
              title: 'البريد الالكتروني',
              onSaved: (val) {
                email = val;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              title: 'رقم الهاتف',
              icon: Image.asset('assets/images/EG.png'),
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
            CustomButton(
              text: 'انشاء حساب',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  widget.emailSaved(email!);
                  widget.phoneSaved(phone!);
                  BlocProvider.of<RegisterCubit>(context).register(firstName!,
                      secondName!, email!, password!, phone!, widget.userType);
                  
                }
              },
            ),
          ],
        ),
      );
  
  }
}
