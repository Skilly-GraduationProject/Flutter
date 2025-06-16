import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../manager/VerifyCodeCubit/verifycode_cubit.dart';
import '../../manager/VerifyCodeCubit/verifycode_states.dart';
import 'code_numbers.dart';
import 'custom_button.dart';

class VerficationCodeViewBody extends StatefulWidget {
  const VerficationCodeViewBody({super.key});

  @override
  State<VerficationCodeViewBody> createState() =>
      _VerficationCodeViewBodyState();
}

class _VerficationCodeViewBodyState extends State<VerficationCodeViewBody> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra;
    String? email = '';
    String? phone = '';
    if (extra != null && extra is Map<String, dynamic>) {
      email = extra['email'];
      phone = extra['phone'];
    }
    print('email $email');
    print('phone $phone');

    return BlocConsumer<VerifycodeCubit, VerifyCodeState>(
        listener: (context, state) {
      if (state is VerifyCodeSuccess) {
        GoRouter.of(context).push('/reset', extra: {'email': email ?? ''});
      } else if (state is VerifyCodeFailure) {
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
                  BlocProvider.of<VerifycodeCubit>(context)
                      .verifyCode(code: code, email: email!);
                  print('email $email');
                },
              )
            ]),
      );
    });
  }
}
