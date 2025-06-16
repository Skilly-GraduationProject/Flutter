import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../../../../core/navigation/router_path.dart';
import '../../../domain/entities/all_services_entity.dart';
import '../../manager/StartPayment/start_payment_cubit.dart';
import '../../manager/StartPayment/start_payment_states.dart';

class ConfirmService extends StatefulWidget {
  const ConfirmService({
    super.key,
    required this.text,
    required this.option1,
    required this.option2,
    this.onTap,
    this.service,
  });
  final AllServicesEntity? service;
  final String text, option1, option2;
  final void Function()? onTap;

  @override
  State<ConfirmService> createState() => _ConfirmServiceState();
}

class _ConfirmServiceState extends State<ConfirmService> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StartPaymentCubit>(context).startPayment(widget.service!.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StartPaymentCubit, StartPaymentStates>(
        listener: (context, state) {
          if (state is StartPaymentSuccess) {
            Navigator.pop(context);
            GoRouter.of(context)
                .push(RouterPath.paymentView, extra: state.paymentUrl);
          } else if (state is StartPaymentFailure) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('فشل بدء الدفع: ${state.error}')),
            );
          }
        },
        child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('assets/images/logo.png',
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
                        Text(
                          widget.text,
                          style: TextStyleManager.style16BoldBlack,
                        ),
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
                            onPressed: () {
                              BlocProvider.of<StartPaymentCubit>(context)
                                  .startPayment(
                                widget.service!.id,
                              );
                            },
                            child: Text(widget.option1,
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
                            child: Text(widget.option2,
                                style: const TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                  ],
                ),
              ),
            )));
  }
}
