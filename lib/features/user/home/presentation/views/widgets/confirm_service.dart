import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import '../../../../../../core/managers/color_manager.dart';

class ConfirmService extends StatelessWidget {
  const ConfirmService({super.key, required this.text, required this.option1, required this.option2, this.onTap,});

  final String text, option1, option2;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset( 'assets/images/logo.png',
                      width: context.responsiveWidth(150),
                      height: context.responsiveWidth(70),
                      fit: BoxFit.fill),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(text),
                  ],
                ),
                const Gap(20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primary,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: onTap,
                        child:  Text(option1,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.secondary,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        child:  Text(option2,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                const Gap(10),
              ],
            ),
          ),
        ));
  }
}
