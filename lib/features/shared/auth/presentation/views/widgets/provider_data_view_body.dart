import 'package:flutter/material.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/provider_data_form.dart';

class ProviderDataViewBody extends StatelessWidget {
  const ProviderDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'بيانات موفر الخدمه',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const Text(
            'برجاء ادخال بياناتك بعنايه',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 20),
          const ProviderDataForm(),
        ],
      ),
    );
  }
}
