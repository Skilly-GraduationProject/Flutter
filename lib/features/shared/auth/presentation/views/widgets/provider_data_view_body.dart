import 'package:flutter/material.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/provider_data_form.dart';

class ProviderDataViewBody extends StatelessWidget {
  const ProviderDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 90),
          const Text(
            'بيانات موفر الخدمه',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const Text(
            'برجاء ادخال بياناتك بعنايه',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xff1C274C),
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  Icons.upload_outlined,
                  size: 40,
                  color: Color(0xff1C274C),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'يرجى اختيار صورة شخصية واضحة و مناسبة',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: 40),
      const   ProviderDataForm(),
        ],
      ),
    );
  }
}
