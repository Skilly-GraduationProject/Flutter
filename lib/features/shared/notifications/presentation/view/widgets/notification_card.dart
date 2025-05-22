import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/shadow_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: Text("حذف", style: TextStyleManager.style14BoldWhite),
        ),
      ),
      onDismissed: (direction) {},
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [ShadowManager.cardShadow]),
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(
                    ImageManager.avatar,
                    fit: BoxFit.cover,
                    height: context.responsiveHeight(70),
                  )),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "عنوان الاشعار",
                      style: TextStyleManager.style14BoldSec,
                    ),
                    Text(
                      "محتوي الاشعار محتوي الاشعار محتوي الاشعار محتوي الاشعار محتوي الاشعار محتوي الاشعار محتوي الاشعار",
                      style: TextStyleManager.style12RegSec,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ])
          ])),
    );
  }
}
