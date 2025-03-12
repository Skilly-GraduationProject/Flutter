import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/shadow_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
        itemCount: 10,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) => const NotificationCard(),
        separatorBuilder: (context, index) => const Gap(10),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Text("حذف", style: TextStyleManager.style14BoldWhite),
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
