import 'package:flutter/material.dart';

import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/image_manager.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(ImageManager.banner)),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'عنوان الخدمة',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  'تفاصيل قصيرة عن الخدمة تفاصيل قصيرة عن الخدمة',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text('العروض'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '5',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: ColorManager.blue),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
