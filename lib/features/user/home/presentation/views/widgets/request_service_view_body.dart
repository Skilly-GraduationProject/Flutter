import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../shared/auth/presentation/views/widgets/custom_button.dart';
import '../../../../../shared/auth/presentation/views/widgets/custom_text_field.dart';
import '../request_service_view.dart';
import 'calender.dart';
import 'custom_app_bar.dart';
import 'drop_down_list.dart';

class RequestServiceViewBody extends StatefulWidget {
  const RequestServiceViewBody({super.key});

  @override
  State<RequestServiceViewBody> createState() => _RequestServiceViewBodyState();
}

class _RequestServiceViewBodyState extends State<RequestServiceViewBody> {
  String? name, price, duration, notes;

  File? selectedImage;
  File? selectedVideo;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomAppBar(title: "طلب خدمة"),
          const TitleWidget(
            title: 'عنوان الخدمة',
          ),
          CustomTextField(
            title: '',
            onSaved: (val) {
              name = val;
            },
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              TitleWidget(
                title: "السعر",
              ),
              SizedBox(
                width: 120,
              ),
              TitleWidget(
                title: 'مدة التسليم',
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: CustomTextField(
                title: '',
                onSaved: (val) {
                  price = val;
                },
              )),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: CustomTextField(
                title: '',
                onSaved: (val) {
                  duration = val;
                },
              )),
            ],
          ),
          const SizedBox(height: 10),
          const TitleWidget(
            title: 'تاريخ البدء',
          ),
          const Calender(),
          const SizedBox(height: 10),
          const TitleWidget(
            title: 'القسم',
          ),
          const DropDownList(),
          const SizedBox(height: 10),
          const TitleWidget(
            title: "ملاحظات",
          ),
          CustomTextField(
              maxLines: 4,
              title: '',
              onSaved: (val) {
                notes = val;
              }),
          const SizedBox(height: 10),
          const TitleWidget(
            title: 'فيديو',
          ),
          CustomTextField(
              maxLines: 4,
              title: '',
              onSaved: (val) {
                notes = val;
              }),
          const SizedBox(height: 20),
          const CustomButton(text: 'طلب الخدمة')
        ]));
  }
}
