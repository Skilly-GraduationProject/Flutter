import 'package:flutter/material.dart';
import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../../../../core/widgets/buttons/small_primary_button.dart';
import '../../../domain/entities/all_services_entity.dart';
import '../request_service_view.dart';
import 'confirm_service.dart';
import 'info_box.dart';

class BuyServiceSheet extends StatelessWidget {
  final AllServicesEntity service;
  final bool useDiscount;

  const BuyServiceSheet(
      {super.key, required this.service, this.useDiscount = false});

  @override
  Widget build(BuildContext context) {
    final double price = useDiscount ? service.discountPrice! : service.price;
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'شراء الخدمة',
                  style: TextStyleManager.style18BoldSec
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleWidget(title: 'عنوان الخدمة'),
                  Text(service.name, style: TextStyleManager.style14BoldGrey),
                  const SizedBox(height: 20),
                  InfoBox(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'السعر',
                        style: TextStyleManager.style14BoldBlack,
                      ),
                      Text(
                        '$price ج.م',
                        style: TextStyleManager.style12BoldPrimary,
                      )
                    ],
                  )),
                  InfoBox(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'مدة التسليم',
                        style: TextStyleManager.style14BoldBlack,
                      ),
                      Text(
                        service.deliveryTime,
                        style: TextStyleManager.style12BoldPrimary,
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SmallPrimaryButton(
                          text: 'شراء',
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(32),
                                ),
                              ),
                              isScrollControlled: true,
                              builder: (_) => ConfirmService(
                                service: service,
                                text: 'هل انت متاكد من شراء الخدمه',
                                option1: 'شراء',
                                option2: 'رجوع',
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
