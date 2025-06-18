import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/buttons/secondary_button.dart';
import 'package:grad_project/core/widgets/show_custom_loading.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';
import 'package:grad_project/features/provider/requested_service/data/models/offer_model/send_offer_model.dart';
import 'package:grad_project/features/provider/requested_service/presentation/manager/cubit/service_cubit.dart';
import 'package:grad_project/features/provider/requested_service/presentation/manager/cubit/service_state.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/add_service_view_body.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/custom_toast.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/image_slider.dart';
import 'package:grad_project/generated/l10n.dart';

import '../../../../../core/helper/service_locator.dart';
import '../../data/repo/service_repo.dart';

class SendOfferDialog extends StatefulWidget {
  const SendOfferDialog({
    super.key,
    required this.serviceId,
  });
  final String serviceId;
  @override
  State<SendOfferDialog> createState() => _SendOfferDialogState();
}

class _SendOfferDialogState extends State<SendOfferDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _deliveryTimeController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ServiceCubit(serviceRepo: getIt<ServiceRepo>()),
      child: Builder(
        builder: (context) {
          return BlocListener<ServiceCubit, ServiceCubitState>(
            listener: (context, state) {
              if (state.sendOfferState == CubitState.success) {
                context.pop();
                context.pop();
                showToast(
                    context: context,
                    title: "تم الارسال",
                    message: "تم ارسال العرض بنجاح",
                    contentType: ContentType.success);
              } else if (state.sendOfferState == CubitState.failure) {
                context.pop();
                context.pop();
                showToast(
                    context: context,
                    title: "حدث خطا",
                    message: state.sendOfferError ?? "حدث خطا",
                    contentType: ContentType.failure);
              } else if (state.sendOfferState == CubitState.loading) {
                showCustomLoading(context);
              }
            },
            child: Dialog(
              insetPadding: EdgeInsets.symmetric(
                horizontal: context.responsiveWidth(20),
                vertical: context.responsiveHeight(20),
              ),
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: Colors.white,
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: context.width,
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              color: ColorManager.primary,
                            ),
                            child: Center(
                              child: Text(
                                "العرض",
                                style: TextStyleManager.style16BoldWhite,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                const Gap(20),
                                Row(
                                  children: [
                                    Flexible(
                                      child: FieldWithTitle(
                                        title: "السعر",
                                        maxLines: 1,
                                        controller: _priceController,
                                        keyboardType: TextInputType.number,
                                        suffix: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            "ج.م",
                                            style: TextStyle(
                                                color: ColorManager.primary,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Gap(20),
                                    Flexible(
                                      child: FieldWithTitle(
                                        title: "مده التسليم",
                                        maxLines: 1,
                                        controller: _deliveryTimeController,
                                        keyboardType: TextInputType.number,
                                        suffix: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            "يوم",
                                            style: TextStyle(
                                                color: ColorManager.primary,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(20),
                                FieldWithTitle(
                                  title: 'ملاحظات',
                                  maxLines: 3,
                                  controller: _notesController,
                                ),
                                const Gap(20),
                                PrimaryButton(
                                  text: "ارسال",
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      SendOfferModel offerModel = SendOfferModel(
                                        salary: double.parse(_priceController.text),
                                        deliveryTime: _deliveryTimeController.text,
                                        notes: _notesController.text,
                                        serviceId: widget.serviceId,
                                      );
                                      context
                                          .read<ServiceCubit>()
                                          .sendOffer(offerModel: offerModel);
                                    }
                                  },
                                ),
                                const Gap(20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
