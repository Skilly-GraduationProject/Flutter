import 'package:flutter/material.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/provider_data_view_body.dart';

class ProviderDataView extends StatelessWidget {
  const ProviderDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body:ProviderDataViewBody(),
    );
  }
}