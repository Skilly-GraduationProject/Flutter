import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/helper/picker_helper.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/icon_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/custom_toast.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/core/widgets/show_custom_loading.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/service.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/manager/cubit/provider_service_cubit.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/manager/cubit/provider_service_state.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/add_service_view_body.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

class EditServiceViewBody extends StatefulWidget {
  const EditServiceViewBody({super.key, required this.service});
  final ProviderService service;

  @override
  State<EditServiceViewBody> createState() => _EditServiceViewBodyState();
}

class _EditServiceViewBodyState extends State<EditServiceViewBody> {
  late GlobalKey<FormState> formKey;
  final List<XFile> _images = [];
  final List<String> _removedImages = [];
  late TextEditingController serviceTitleController;
  late TextEditingController serviceDescriptionController;
  late TextEditingController servicePriceController;
  late TextEditingController serviceDurationController;
  late TextEditingController serviceNotesController;
  late TextEditingController serviceImageController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    serviceTitleController =
        TextEditingController(text: widget.service.name ?? "");
    serviceDescriptionController =
        TextEditingController(text: widget.service.description ?? "");
    servicePriceController =
        TextEditingController(text: widget.service.price?.toString() ?? "");
    serviceDurationController =
        TextEditingController(text: widget.service.deliverytime ?? "");
    serviceNotesController =
        TextEditingController(text: widget.service.notes ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProviderServiceCubit, ProviderServiceState>(
      listener: (context, state) {
        if (state.updateServiceState == CubitState.loading) {
          showCustomLoading(context);
        } else if (state.updateServiceState == CubitState.success) {
          GoRouter.of(context).pop(context);
          showCustomToast(
              context: context,
              message: "تم تعديل الخدمه بنجاح",
              type: ToastType.success);
          GoRouter.of(context).pop(context);
        } else if (state.updateServiceState == CubitState.failure) {
          GoRouter.of(context).pop(context);
          showCustomToast(
              context: context,
              message: "فشل تعديل الخدمه",
              type: ToastType.success);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const Gap(20),
            FieldWithTitle(
              title: "عنوان الخدمه",
              hint: widget.service.name ?? "",
              controller: serviceTitleController,
            ),
            const Gap(20),
            FieldWithTitle(
              title: 'الوصف',
              maxLines: 3,
              controller: serviceDescriptionController,
              hint: widget.service.description ?? "",
            ),
            const Gap(20),
            Row(
              children: [
                Flexible(
                  child: FieldWithTitle(
                    title: 'السعر',
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    controller: servicePriceController,
                    hint: widget.service.price?.toString() ?? "",
                  ),
                ),
                const Gap(10),
                Flexible(
                  child: FieldWithTitle(
                    title: 'مده التسليم',
                    controller: serviceDurationController,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    suffix: const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "يوم",
                            style: TextStyle(
                                color: ColorManager.primary,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    hint: widget.service.deliverytime ?? "",
                  ),
                ),
              ],
            ),
            const Gap(20),
            FieldWithTitle(
              title: 'ملاحظات',
              maxLines: 5,
              controller: serviceNotesController,
              hint: widget.service.notes ?? "",
            ),
            const Gap(20),
            Text(
              'تعديل الصور',
              style: TextStyleManager.style14BoldSec,
            ),
            const Gap(20),
            SizedBox(
              height: context.responsiveHeight(140),
              child: ListView.separated(
                  itemCount: _images.length + widget.service.images!.length + 1,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const Gap(10),
                  itemBuilder: (context, index) {
                    if (index <
                        _images.length + widget.service.images!.length) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Container(
                              height: context.responsiveHeight(140),
                              width: context.responsiveHeight(140),
                              decoration: BoxDecoration(
                                color: ColorManager.whiteShade,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: index < widget.service.images!.length
                                  ? CustomImage(
                                      image:
                                          widget.service.images![index].image!)
                                  : Image.file(File(_images[
                                          index - widget.service.images!.length]
                                      .path)),
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: IconButton(
                                    icon: const Icon(Icons.close,
                                        color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        if (index <
                                            widget.service.images!.length) {
                                          _removedImages.add(widget
                                              .service.images![index].id!);
                                          widget.service.images!
                                              .removeAt(index);

                                          print(
                                              'Removed image from api: $index');
                                        } else {
                                          _images.removeAt(index -
                                              widget.service.images!.length);
                                          print(
                                              'Removed image from local: ${index - widget.service.images!.length}');
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () async {
                          await PickerHelper()
                              .showPickerBottomSheet(
                            context: context,
                            type: ImagePickerType.multi,
                          )
                              .then((value) {
                            if (value != null) {
                              setState(() {
                                if (value is XFile) {
                                  _images.add(value);
                                  print('Picked single image: ${value.path}');
                                } else if (value is List<XFile>) {
                                  _images.addAll(value);
                                  print('Picked ${value.length} images');
                                }
                              });
                            }
                          });
                        },
                        child: Container(
                          height: context.responsiveHeight(40),
                          width: context.responsiveWidth(140),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: ColorManager.whiteShade,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SvgPicture.asset(
                            IconManager.addImage,
                            height: context.responsiveHeight(20),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      );
                    }
                  }),
            ),
            const Gap(20),
            PrimaryButton(
                text: 'حفظ',
                onTap: () {
                  ProviderService service = ProviderService(
                    id: widget.service.id,
                    name: serviceTitleController.text,
                    description: serviceDescriptionController.text,
                    price: double.tryParse(servicePriceController.text),
                    deliverytime: serviceDurationController.text,
                    notes: serviceNotesController.text,
                    images:
                        _images.map((e) => ImageModel(image: e.path)).toList(),
                    deletedImages:
                        _removedImages.isNotEmpty ? _removedImages : null,
                  );
                  context.read<ProviderServiceCubit>().updateService(
                        service: service,
                      );
                }),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
