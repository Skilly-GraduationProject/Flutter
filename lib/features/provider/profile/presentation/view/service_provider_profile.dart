import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';
import 'package:grad_project/features/provider/profile/data/repos/provider_data_repo.dart';
import 'package:grad_project/features/provider/profile/presentation/manager/cubit/provider_data_cubit.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';

class ServiceProviderProfile extends StatelessWidget {
  const ServiceProviderProfile({super.key, required this.providerProfileModel});
  final ProviderProfileModel providerProfileModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProviderDataCubit(repo: getIt<ProviderDataRepo>()),
      child: Scaffold(
        body: SafeArea(
            child: ServiceProviderProfileViewBody(
          providerProfileModel: providerProfileModel,
        )),
      ),
    );
  }
}
