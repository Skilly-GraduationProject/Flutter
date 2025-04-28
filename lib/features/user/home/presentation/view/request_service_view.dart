import 'package:flutter/material.dart';
import 'package:grad_project/features/user/home/presentation/view/widgets/request_service_view_body.dart';

class RequestServiceView extends StatelessWidget {
  const RequestServiceView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white, body: RequestServiceViewBody());
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
