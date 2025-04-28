import 'package:flutter/widgets.dart';

import 'rate_widget.dart';
import 'verified_name.dart';

class ProviderContainer extends StatelessWidget {
  const ProviderContainer({super.key, required this.name, required this.img});

  final String name, img;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Image.network(
            img,
            width: 50,
            height: 50,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerifiedName(name: name,),
          const  RateWidget(),
          ],
        ),
      ],
    );
  }
}
