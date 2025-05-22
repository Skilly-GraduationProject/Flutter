import 'package:flutter/material.dart';

import 'widgets/emergency_view_body.dart';

class EmergencyView extends StatelessWidget {
  const EmergencyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmergencyViewBody(),
    );
  }
}