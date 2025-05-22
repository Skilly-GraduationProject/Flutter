
import 'package:flutter/material.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/view_service_view_body.dart';

import '../../domain/entities/all_services_entity.dart';

class ViewServiceView extends StatelessWidget {
  const ViewServiceView({super.key, required this.service});
  final AllServicesEntity service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ViewServiceViewBody(service: service,),
    );
  }
}
