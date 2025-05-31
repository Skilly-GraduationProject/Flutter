import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/user/home/presentation/manager/StartPayment/start_payment_cubit.dart';
import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../../../../core/navigation/router_path.dart';
import '../../../../../../core/widgets/buttons/small_primary_button.dart';
import '../../../domain/entities/all_services_entity.dart';
import '../../manager/StartPayment/start_payment_states.dart';
import '../request_service_view.dart';
import 'confirm_service.dart';
import 'info_box.dart';

class BuyServiceSheet extends StatefulWidget {
  final AllServicesEntity service;

  const BuyServiceSheet({super.key, required this.service});

  @override
  State<BuyServiceSheet> createState() => _BuyServiceSheetState();
}

class _BuyServiceSheetState extends State<BuyServiceSheet> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StartPaymentCubit>(context).startPayment(widget.service.id);
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
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'شراء الخدمة',
                      style: TextStyleManager.style18BoldSec
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleWidget(title: 'عنوان الخدمة'),
                      Text(widget.service.name,
                          style: TextStyleManager.style14BoldGrey),
                      const SizedBox(height: 20),
                      InfoBox(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'السعر',
                            style: TextStyleManager.style14BoldBlack,
                          ),
                          Text(
                            '${widget.service.price} ج.م',
                            style: TextStyleManager.style12BoldPrimary,
                          )
                        ],
                      )),
                      InfoBox(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'مدة التسليم',
                            style: TextStyleManager.style14BoldBlack,
                          ),
                          Text(
                            widget.service.deliveryTime,
                            style: TextStyleManager.style12BoldPrimary,
                          )
                        ],
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SmallPrimaryButton(
                              text: 'شراء',
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(32),
                                    ),
                                  ),
                                  isScrollControlled: true,
                                  builder: (_) => ConfirmService(
                                    onTap: () {
                                      BlocProvider.of<StartPaymentCubit>(
                                              context)
                                          .startPayment(
                                        widget.service.id,
                                      );
                                    },
                                    text: 'هل انت متاكد من شراء الخدمه',
                                    option1: 'شراء',
                                    option2: 'رجوع',
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
