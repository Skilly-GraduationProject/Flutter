import 'package:flutter/material.dart';

showCustomLoading(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => const Center(
      child: Center(child: CircularProgressIndicator()),
    ),
  );
}

class ShowCustomLoadingWidget extends StatelessWidget {
  const ShowCustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Center(child: CircularProgressIndicator()));
  }
}
