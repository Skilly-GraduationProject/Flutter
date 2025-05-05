
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../../../../core/widgets/buttons/small_primary_button.dart';
import '../../../../../shared/auth/presentation/views/widgets/custom_text_field.dart';
import '../../../domain/entities/all_services_entity.dart';
import '../../manager/AddOffer/add_offer_cubit.dart';
import '../request_service_view.dart';

class PriceOfferSheet extends StatefulWidget {
  final AllServicesEntity service;

  const PriceOfferSheet({super.key, required this.service});

  @override
  State<PriceOfferSheet> createState() => _PriceOfferSheetState();
}

class _PriceOfferSheetState extends State<PriceOfferSheet> {
  String? duration, notes;
  double? price;
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Form(
          key: key,
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
                    "عرض سعر",
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
                    const Row(
                      children: [
                        TitleWidget(title: "السعر"),
                        SizedBox(width: 120),
                        TitleWidget(title: 'مدة التسليم'),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            title: '',
                            onSaved: (val) => price = double.tryParse(val ?? ''),
                            suffix: const Text("ج.م",
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: CustomTextField(
                            title: '',
                            onSaved: (val) => duration = val,
                            suffix: const Text("يوم",
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const TitleWidget(title: "ملاحظات"),
                    CustomTextField(
                      maxLines: 4,
                      title: '',
                      onSaved: (val) => notes = val,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                            child: SmallPrimaryButton(
                          text: 'ارسال',
                          onTap: () {
                            if (key.currentState!.validate()) {
                              key.currentState!.save();
                              BlocProvider.of<AddOfferCubit>(context).addOffer(
                                  notes!, price!, duration!,widget.service.id);
                            }
                          },
                        )),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SmallPrimaryButton(
                            text: 'شات',
                            color: ColorManager.secondary,
                            onTap: () {
                              GoRouter.of(context).push('/chat');
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "الشات للتفاوض على التفاصيل",
                          style: TextStyle(fontSize: 12),
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
      ),
    );
  }
}
