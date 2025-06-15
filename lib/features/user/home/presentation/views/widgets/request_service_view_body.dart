import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/collect_points.dart';
import '../../../../../shared/auth/presentation/views/widgets/custom_button.dart';
import '../../../../../shared/auth/presentation/views/widgets/custom_text_field.dart';
import '../../manager/RequestService/request_service_cubit.dart';
import '../request_service_view.dart';
import 'calender.dart';
import 'custom_app_bar.dart';
import 'drop_down_list.dart';
import 'media_picker.dart';

class RequestServiceViewBody extends StatefulWidget {
  const RequestServiceViewBody({
    super.key,
  });

  @override
  State<RequestServiceViewBody> createState() => _RequestServiceViewBodyState();
}

class _RequestServiceViewBodyState extends State<RequestServiceViewBody> {
  String? name, duration, notes, categoryId, startDate;
  List<File> images = [];
  double? price;
  File? video;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomAppBar(title: "طلب خدمة"),
          const TitleWidget(title: 'عنوان الخدمة'),
          CustomTextField(
            title: '',
            onSaved: (val) => name = val,
          ),
          const SizedBox(height: 10),
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
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextField(
                  title: '',
                  onSaved: (val) => duration = val,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const TitleWidget(title: 'تاريخ البدء'),
          Calender(
            onSelected: (date) {
              startDate = date;
            },
          ),
          const SizedBox(height: 10),
          const TitleWidget(title: 'القسم'),
          DropDownList(
            hint: 'اختر القسم',
            onCategorySelected: (id) {
              setState(() {
                categoryId = id;
              });
            },
          ),
          const SizedBox(height: 10),
          const TitleWidget(title: "ملاحظات"),
          CustomTextField(
            maxLines: 4,
            title: '',
            onSaved: (val) => notes = val,
          ),
          const SizedBox(height: 6),
          MediaPickerWidget(
            onMediaChanged: (pickedImages, pickedVideo, pickedPdf) {
              setState(() {
                images = pickedImages!;
                video = pickedVideo;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomButton(
              text: 'طلب الخدمة',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  BlocProvider.of<RequestServiceCubit>(context).requestService(
                    duration!,
                    name!,
                    notes!,
                    categoryId!,
                    video,
                    startDate!,
                    images,
                    price!,
                  );
                }
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                    ),
                    isScrollControlled: true,
                    builder: (_) => const CollectPoints());
              }),
        ]),
      ),
    );
  }
}
