import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sliding_toast/flutter_sliding_toast.dart';
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
import 'package:grad_project/features/provider/profile/data/models/get_my_gallery_model/servicesgallery.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/add_service_to_gallery_view_body.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/manager/cubit/provider_service_cubit.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/manager/cubit/provider_service_state.dart';
import 'package:image_picker/image_picker.dart';

class AddGalleryServiceViewBody extends StatelessWidget {
  const AddGalleryServiceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProviderServiceCubit, ProviderServiceState>(
      buildWhen: (previous, current) =>
          previous.addGalleryServiceState != current.addGalleryServiceState,
      listenWhen: (previous, current) =>
          previous.addGalleryServiceState != current.addGalleryServiceState,
      listener: (context, state) {
        if (state.addGalleryServiceState == CubitState.success) {
          context.pop();
          context.pop();
          InteractiveToast.slide(
              toastSetting: const SlidingToastSetting(
                  toastAlignment: Alignment.topCenter, showProgressBar: false),
              toastStyle: const ToastStyle(
                backgroundColor: Colors.lightGreen,
              ),
               context,
              title: Text(
                "تمت الاضافه بنجاح",
                style: TextStyleManager.style12RegWhite,
              ));
        } else if (state.addGalleryServiceState == CubitState.failure) {
          context.pop();
          InteractiveToast.slide(
              toastSetting: const SlidingToastSetting(
                  toastAlignment: Alignment.topCenter, showProgressBar: false),
              toastStyle: const ToastStyle(
                  backgroundColor: Colors.red,
                  progressBarColor: ColorManager.blue),
              context,
              title: Text(
                "حدث خطأ",
                style: TextStyleManager.style12RegWhite,
              ));
        } else if (state.addGalleryServiceState == CubitState.loading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return const AddGalleryServiceForm();
      },
    );
  }
}

class AddGalleryServiceForm extends StatefulWidget {
  const AddGalleryServiceForm({
    super.key,
  });

  @override
  State<AddGalleryServiceForm> createState() => _AddGalleryServiceFormState();
}

class _AddGalleryServiceFormState extends State<AddGalleryServiceForm> {
  late GlobalKey<FormState> formKey;
  late TextEditingController serviceTitleController;
  late TextEditingController serviceDescriptionController;
  late TextEditingController servicePriceController;
  late TextEditingController serviceDurationController;
  late TextEditingController serviceNotesController;
  late TextEditingController serviceImageController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    serviceTitleController = TextEditingController();
    serviceDescriptionController = TextEditingController();
    servicePriceController = TextEditingController();
    serviceDurationController = TextEditingController();
    serviceNotesController = TextEditingController();
    serviceImageController = TextEditingController();
    serviceImageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    serviceTitleController.dispose();
    serviceDescriptionController.dispose();
    servicePriceController.dispose();
    serviceDurationController.dispose();
    serviceNotesController.dispose();
    serviceImageController.dispose();
    super.dispose();
  }

  final List<XFile> _images = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          const Gap(20),
          FieldWithTitle(
            title: 'عنوان الخدمه',
            controller: serviceTitleController,
          ),
          const Gap(20),
          FieldWithTitle(
            title: 'وصف الخدمه',
            controller: serviceDescriptionController,
          ),
          const Gap(20),
          Row(
            children: [
              // Flexible(
              //   child: FieldWithTitle(
              //     title: 'السعر',
              //     maxLines: 1,
              //     keyboardType: TextInputType.number,
              //     controller: servicePriceController,
              //   ),
              // ),
              // const Gap(10),
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
                ),
              ),
            ],
          ),
          // const Gap(20),
          // FieldWithTitle(
          //   title: 'ملاحظات',
          //   maxLines: 5,
          //   controller: serviceNotesController,
          // ),
          const Gap(20),
          Text(
            'اضافه صوره',
            style: TextStyleManager.style14BoldSec,
          ),
          const Gap(20),
          SizedBox(
            height: context.responsiveHeight(140),
            child: ListView.separated(
                itemCount: _images.length + 1,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (context, index) {
                  if (index < _images.length) {
                    // العناصر الحالية (صور)
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Container(
                            width: context.responsiveHeight(140),
                            height: context.responsiveHeight(140),
                            decoration: BoxDecoration(
                              color: ColorManager.whiteShade,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.file(File(_images[index].path),fit: BoxFit.cover,),
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
                                      _images.removeAt(index);
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
          // Text(
          //   'اضافه فيديو',
          //   style: TextStyleManager.style14BoldSec,
          // ),
          // const Gap(20),
          // Container(
          //   height: context.responsiveHeight(140),
          //   padding: const EdgeInsets.all(20),
          //   decoration: BoxDecoration(
          //     color: ColorManager.whiteShade,
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: Center(
          //     child: SvgPicture.asset(
          //       IconManager.addImage,
          //       height: context.responsiveHeight(40),
          //     ),
          //   ),
          // ),
          const Gap(30),
          PrimaryButton(
            text: "اضافه الخدمه",
            onTap: () {
              if (formKey.currentState!.validate()) {
                GalleryService serviceModel = GalleryService(
                  galleryName: serviceTitleController.text,
                  description: serviceDescriptionController.text,
                  deliverytime: serviceDurationController.text,
                  images: _images.map((e) => e.path).toList(),
                );
                context
                    .read<ProviderServiceCubit>()
                    .addGalleryService(serviceModel);
              }
            },
          ),
        ],
      ),
    );
  }
}
