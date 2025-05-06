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
  String? duration, notes, token;
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
                            onSaved: (val) =>
                                price = double.tryParse(val ?? ''),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SmallPrimaryButton(
                            text: 'ارسال',
                            onTap: () {
                              if (key.currentState!.validate()) {
                                key.currentState!.save();
                                token =
                                    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImFiOTVlZDI2LTAzODAtNGMzMC05Y2M4LTU0MjRlN2U3YmY5NCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL21vYmlsZXBob25lIjoiMDEyMjE2NDMxOTUiLCJqdGkiOiI3M2IzMDk0YS0xZDQyLTQwZmEtYThmNC1mMGQ2MGE4NGU4NTciLCJleHAiOjE3NDg1MzExOTQsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI3MSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.HFe0kcwr0MUpBNBjWWRC2U3I-7E5Iob5z_dvrcGgTGg';
                                BlocProvider.of<AddOfferCubit>(context)
                                    .addOffer(
                                  widget.service.id,
                                  token!,
                                  price!,
                                  duration!,
                                  notes!,
                                );
                                GoRouter.of(context).pop();
                              }
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
