import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/home/data/models/get_requested_services_model/service.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';
import 'package:grad_project/features/provider/requested_service/data/repo/service_repo.dart';
import 'package:grad_project/features/provider/requested_service/presentation/manager/cubit/service_cubit.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/add_service_view_body.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/get_service_view_body.dart';

class GetServiceView extends StatelessWidget {
  const GetServiceView({super.key, required this.serviceId});
  final String serviceId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceCubit(serviceRepo: getIt<ServiceRepo>())
        ..getRequestedService(serviceId: serviceId),
      child: Scaffold(
        appBar: AppBar(
          primary: true,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "الخدمه",
            style: TextStyleManager.style18BoldSec,
          ),
          centerTitle: true,
          leading: const BackIcon(),
        ),
        body: SafeArea(
          child: GetServiceViewBody(
            serviceId: serviceId,
          ),
        ),
      ),
    );
  }
}
