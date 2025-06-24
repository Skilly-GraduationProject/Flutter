import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../manager/LoginCubit/login_cubit.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'switch.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool remember = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserCredentials();
  }

  Future<void> loadUserCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPhone = prefs.getString('phone') ?? '';
    final savedPassword = prefs.getString('password') ?? '';

    phoneController.text = savedPhone;
    passwordController.text = savedPassword;

    setState(() {
      remember = savedPhone.isNotEmpty && savedPassword.isNotEmpty;
      isLoading = false;
    });
  }

  Future<void> saveUserCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone', phoneController.text);
    await prefs.setString('password', passwordController.text);
  }

  bool updateRemember(bool val) {
    setState(() {
      remember = val;
    });
    return remember;
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: isLoading ? 0.5 : 1,
          child: AbsorbPointer(
            absorbing: isLoading,
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  // GoRouter.of(context).push(RouterPath.userHome);
                } else if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const CustomLoadingIndicator();
                }

                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        onSaved: (val) {},
                        title: 'رقم الهاتف',
                        controller: phoneController,
                        icon: Image.asset('assets/images/EG.png'),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        onSaved: (val) {},
                        title: 'الرقم السري',
                        controller: passwordController,
                        icon: Image.asset('assets/images/Hide.png'),
                      ),
                      const SizedBox(height: 15),
                      RememberSwitch(
                        remember: remember,
                        title: 'تذكرني',
                        onChanged: updateRemember,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                GoRouter.of(context).push('/forgotPass'),
                            child: const Text(
                              'هل نسيت كلمه المرور؟',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        text: 'تسجيل الدخول',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            if (remember) {
                              saveUserCredentials();
                            }

                            BlocProvider.of<LoginCubit>(context).login(
                              phoneController.text,
                              passwordController.text,
                              remember,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        if (isLoading)
          const Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
