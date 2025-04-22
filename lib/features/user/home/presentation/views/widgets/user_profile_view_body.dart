import 'package:flutter/material.dart';
import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/image_manager.dart';
import 'custom_app_bar.dart';
import 'orders_list_view.dart';
import 'rate_widget.dart';
import 'verified_name.dart';

class UserProfileViewBody extends StatefulWidget {
  const UserProfileViewBody({super.key});

  @override
  State<UserProfileViewBody> createState() => _UserProfileViewBodyState();
}

class _UserProfileViewBodyState extends State<UserProfileViewBody> {
  bool showPersonalInfo = true;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomAppBar(title: 'الحساب الشخصي'),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(ImageManager.avatar),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VerifiedName(name: 'hla',),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RateWidget(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // setState(() {
                        //   showPersonalInfo = !showPersonalInfo;
                        // });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              showPersonalInfo ? 'البيانات الشخصية' : 'الطلبات',
                              style: const TextStyle(color: Colors.white),
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
                    // showPersonalInfo ? buildPersonalInfo() : buildOrders(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'طلباتي',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
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
                      ],
                    ),
                  ]))),
      const OrdersListView(),
    ]);
  }
}
