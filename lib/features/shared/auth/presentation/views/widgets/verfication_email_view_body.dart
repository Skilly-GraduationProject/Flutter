import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../manager/VerifyCodeCubit/verifycode_states.dart';
import '../../manager/VerifyEmailCubit/verifyemail_cubit.dart';
import '../../manager/VerifyEmailCubit/verifyemail_states.dart';
import 'code_numbers.dart';
import 'custom_button.dart';

class VerficationEmailViewBody extends StatefulWidget {
  const VerficationEmailViewBody({super.key});

  @override
  State<VerficationEmailViewBody> createState() =>
      _VerficationEmailViewBodyState();
}

class _VerficationEmailViewBodyState extends State<VerficationEmailViewBody> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>;
    final email = extra['email'] ?? '';
    final phone = extra['phone'] ?? '';
    final userType = extra['userType'] ?? 0;
    print(email);
    print(phone);
    print(userType);
    return BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
        listener: (context, state) {
      if (state is VerifyEmailSuccess) {
        if (userType == 0) {
          GoRouter.of(context).push('/user');
        } else {
          GoRouter.of(context).push('/provider');
        }
        // GoRouter.of(context).push('/signIn');
      } else if (state is VerifyEmailFailure) {
        print(state.error);
      }
    }, builder: (context, state) {
      if (state is VerifyCodeLoading) {
        return const CustomLoadingIndicator();
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'التحقق',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              Text(
                'التحقق من ملكيه الحساب',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700]),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'قم بكتابة كود التحقق الذي تم إرساله الي',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '$email',
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: kPrimaryColor),
              ),
              const SizedBox(
                height: 40,
              ),
              CodeNumbers(
                controller1: controller1,
                controller2: controller2,
                controller3: controller3,
                controller4: controller4,
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: 'التالي',
                onTap: () {
                  final code = controller4.text +
                      controller3.text +
                      controller2.text +
                      controller1.text;

                  print(code);
                  BlocProvider.of<VerifyEmailCubit>(context)
                      .verifyEmail(code: code, email: email!);
                },
              )
            ]),
      );
    });
  }
}
