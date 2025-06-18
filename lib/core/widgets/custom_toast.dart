import 'package:flutter/material.dart';
import 'package:flutter_sliding_toast/flutter_sliding_toast.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';

showCustomToast(
    {required BuildContext context, String? message, required ToastType type}) {
  InteractiveToast.slide(
      toastSetting: const SlidingToastSetting(
          toastAlignment: Alignment.topCenter, showProgressBar: false),
      toastStyle: ToastStyle(
        backgroundColor:
            type == ToastType.failure ? Colors.red : Colors.lightGreen,
      ),
      context,
      title: Text(
        message ??
            (type == ToastType.failure ? "فشلت العمليه" : "تمت العمليه بنجاح"),
        style: TextStyleManager.style12RegWhite,
      ));
}

enum ToastType {
  success,
  failure;
}
