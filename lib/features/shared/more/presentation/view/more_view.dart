import 'package:flutter/material.dart';
import 'package:grad_project/features/shared/more/presentation/view/widgets/more_view_body.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: MoreViewBody(),
        ),
      ),
    );
  }
}
