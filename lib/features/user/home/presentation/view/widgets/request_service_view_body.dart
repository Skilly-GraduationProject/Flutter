import 'package:flutter/material.dart';

import '../../../../../shared/auth/presentation/views/widgets/custom_button.dart';
import '../../../../../shared/auth/presentation/views/widgets/custom_drop_down.dart';
import '../../../../../shared/auth/presentation/views/widgets/custom_text_field.dart';
import '../request_service_view.dart';
import 'custom_app_bar.dart';

class RequestServiceViewBody extends StatefulWidget {
  const RequestServiceViewBody({super.key});

  @override
  State<RequestServiceViewBody> createState() => _RequestServiceViewBodyState();
}

class _RequestServiceViewBodyState extends State<RequestServiceViewBody> {
  final List<String> departments = ['البرمجة', 'النجارة', 'الديكور'];
  final List<String> h = ['1/1', '2/2', '3/3'];
  String? selectedDepartment, selectedH, serviceName, price, duration, notes;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomAppBar(title: "طلب خدمة"),
          const TitleWidget(
            title: "عنوان الخدمة",
          ),
          CustomTextField(
            title: '',
            onSaved: (val) {
              serviceName = val;
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
                title: '1000',
                onSaved: (val) {
                  price = val;
                },
              )),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: CustomTextField(
                title: 'ايام',
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
          CustomDropDown(
            selectedValue: selectedH,
            hint: 'اختر تاريخ البدء',
            items: h,
            onChanged: (value) {
              setState(() {
                selectedH = value;
              });
            },
          ),
          const SizedBox(height: 10),
          const TitleWidget(
            title: 'القسم',
          ),
          CustomDropDown(
            selectedValue: selectedDepartment,
            hint: 'القسم',
            items: departments,
            onChanged: (value) {
              setState(() {
                selectedDepartment = value;
              });
            },
          ),
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
