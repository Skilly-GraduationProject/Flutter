import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../../../../core/navigation/router_path.dart';
import '../../../domain/entities/user_profile_data_entity.dart';
import 'custom_app_bar.dart';
import 'orders_list_view.dart';
import 'personal_data_widget.dart';
import 'verified_name.dart';

class UserProfileViewBody extends StatefulWidget {
  const UserProfileViewBody({super.key, required this.data});

  final UserProfileDataEntity data;
  @override
  State<UserProfileViewBody> createState() => _UserProfileViewBodyState();
}

class _UserProfileViewBodyState extends State<UserProfileViewBody> {
  bool showPersonalInfo = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const CustomAppBar(title: 'الحساب الشخصي'),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(widget.data.img),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VerifiedName(
                name: widget.data.name,
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              setState(() {
                showPersonalInfo = !showPersonalInfo;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'البيانات الشخصية',
                    style: TextStyleManager.style14BoldWhite,
                  ),
                  Icon(
                    showPersonalInfo
                        ? Icons.arrow_drop_down
                        : Icons.arrow_drop_up,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          showPersonalInfo
              ? SizedBox(
                  width: double.infinity,
                  child: MyPersonalDataWidget(
                    email: widget.data.email,
                    phone: widget.data.phone,
                    city: widget.data.city,
                    streetName: widget.data.streetName,
                  ),
                )
              : const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'طلباتي',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(RouterPath.ordersView, );
                },
                child: const Row(
                  children: [
                    Text('عرض الكل'),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      )),
      const OrdersListView(),
    ]);
  }
}
