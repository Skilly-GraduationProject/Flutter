import 'package:flutter/material.dart';

import 'widgets/offered_services_view_body.dart';

class OfferedServicesView extends StatelessWidget {
  const OfferedServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OfferedServicesViewBody(),
    );
  }
}
