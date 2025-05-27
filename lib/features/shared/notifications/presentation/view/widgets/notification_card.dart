import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/shadow_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/features/shared/notifications/data/models/get_notifications_model/notification.dart';
import 'package:grad_project/features/shared/notifications/presentation/manager/cubit/notifications_cubit.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notificationModel,
  });
  final NotificationModel? notificationModel;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        context
            .read<NotificationsCubit>()
            .deleteNotification(notificationId: notificationModel!.id!);
        // إذا كنت تستخدم setState أو Bloc داخلي لتحديث القائمة:
        // context.read<NnotificationsCubit>().removeNotificationFromList(index);
      },
      background: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: Text("حذف", style: TextStyleManager.style14BoldWhite),
        ),
      ),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [ShadowManager.cardShadow]),
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(children: [
              notificationModel?.userImg == null
                  ? const Gap(0)
                  : Column(
                      children: [
                        ClipOval(
                            child: CustomImage(
                          image: notificationModel?.userImg,
                          fit: BoxFit.cover,
                          height: context.responsiveHeight(70),
                          width: context.responsiveHeight(70),
                        )),
                        const Gap(12),
                      ],
                    ),
              const Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notificationModel?.title ?? "",
                      style: TextStyleManager.style14BoldSec,
                    ),
                    Text(
                      notificationModel?.body ?? "",
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
