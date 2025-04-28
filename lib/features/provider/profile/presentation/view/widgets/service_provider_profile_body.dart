import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_secure_storage/test/test_flutter_secure_storage_platform.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/icon_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/shadow_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';

class ServiceProviderProfileViewBody extends StatelessWidget {
  const ServiceProviderProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverAppBar(
            pinned: true,
            primary: true,
            foregroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: const BackIcon(),
            actions: [
              Text(
                "تعديل",
                style: TextStyleManager.style12BoldSec,
              )
            ],
            title: Text(
              "الحساب الشخصي",
              style: TextStyleManager.style18BoldSec,
            ),
            centerTitle: true,
          ),
        ),
        SliverGap(context.responsiveHeight(40)),
        const SliverToBoxAdapter(
          child: UserInfoWidget(),
        ),
        const SliverGap(13),
        SliverToBoxAdapter(
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              IconManager.chat,
              height: context.responsiveHeight(30),
            ),
          ),
        ),
        const SliverGap(20),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: Text(
              "نجار ماهر متخصص في تصميم وتنفيذ الأثاث والأعمال الخشبية بدقة وإبداع، يتميز بخبرته في اختيار أفضل أنواع الخشب وتحويلها إلى قطع فنية تلبي احتياجات العملاء.",
              style: TextStyleManager.style14RegSec,
            ),
          ),
        ),
        const SliverGap(20),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "عدد الاعمال المنتهيه",
                  style: TextStyleManager.style16BoldSec,
                ),
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: const BoxDecoration(
                      color: ColorManager.secondary, shape: BoxShape.circle),
                  child: Text(
                    "5",
                    style: TextStyleManager.style16BoldWhite,
                  ),
                )
              ],
            ),
          ),
        ),
        const SliverGap(20),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: MyPersonalData(),
          ),
        ),
        const SliverGap(20),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "خدماتي",
                      style: TextStyleManager.style16BoldSec,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(RouterPath.myServicesView);
                      },
                      child: Row(
                        children: [
                          Text(
                            "عرض الكل",
                            style: TextStyleManager.style14RegSec,
                          ),
                          const Gap(3),
                          const Icon(
                            Icons.arrow_forward_outlined,
                            color: ColorManager.secondary,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SliverGap(20),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio:
                  context.responsiveWidth(200) / context.responsiveHeight(250),
            ),
            itemCount: 2,
            itemBuilder: (context, index) {
              return const MyServicesCard();
            },
          ),
        ),
        const SliverGap(20),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "معرض الاعمال",
                      style: TextStyleManager.style16BoldSec,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(RouterPath.myWorkView);
                      },
                      child: Row(
                        children: [
                          Text(
                            "عرض الكل",
                            style: TextStyleManager.style14RegSec,
                          ),
                          const Gap(3),
                          const Icon(
                            Icons.arrow_forward_outlined,
                            color: ColorManager.secondary,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SliverGap(20),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio:
                  context.responsiveWidth(200) / context.responsiveHeight(250),
            ),
            itemCount: 2,
            itemBuilder: (context, index) {
              return const MyWorkCard();
            },
          ),
        ),
        const SliverGap(20),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "التقييمات",
                      style: TextStyleManager.style16BoldSec,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(RouterPath.myReviewsView);
                      },
                      child: Row(
                        children: [
                          Text(
                            "عرض الكل",
                            style: TextStyleManager.style14RegSec,
                          ),
                          const Gap(3),
                          const Icon(
                            Icons.arrow_forward_outlined,
                            color: ColorManager.secondary,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SliverGap(20),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList.separated(
              itemCount: 3,
              itemBuilder: (context, index) => const ReviewCard(),
              separatorBuilder: (context, index) => const Gap(10)),
        ),
      ],
    );
  }
}

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: GoRouter.of(context).canPop()
          ? Icon(
              Icons.arrow_circle_right_outlined,
              size: context.responsiveHeight(30),
              color: ColorManager.secondary,
            )
          : SizedBox.shrink(),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(800),
            child: SizedBox(
              height: context.responsiveHeight(170),
              width: context.responsiveHeight(170),
              child: Image.asset(
                ImageManager.avatar,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "اسم المستخدم",
                style: TextStyleManager.style20BoldSec,
              ),
              const Gap(10),
              Image.asset(
                ImageManager.verifyIcon,
                height: context.responsiveHeight(24),
              ),
            ],
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                IconManager.rate,
                height: context.responsiveHeight(20),
              ),
              const Gap(3),
              Text("4.5", style: TextStyleManager.style14RegSec)
            ],
          ),
        ],
      ),
    );
  }
}

class MyPersonalData extends StatelessWidget {
  const MyPersonalData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandedTile(
      trailing: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.white,
        size: context.responsiveHeight(20),
      ),
      trailingRotation: 180,
      title: Text(
        "البيانات الشخصيه",
        style: TextStyleManager.style14BoldWhite,
      ),
      theme: const ExpandedTileThemeData(
          headerSplashColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          contentBackgroundColor: Colors.transparent,
          contentSeparatorColor: Colors.transparent,
          headerBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          headerColor: ColorManager.primary),
      controller: ExpandedTileController(),
      content: const Column(
        children: [
          Gap(10),
          PersonalDetailRow(
            title: "رقم الهاتف",
            value: "+201020301328",
          ),
          Gap(10),
          PersonalDetailRow(
            title: "البريد",
            value: "gomaaeyad12@gmail.com",
          ),
          Gap(10),
          PersonalDetailRow(
            title: "المهنه",
            value: "نجار",
          ),
          Gap(10),
          PersonalDetailRow(
            title: "سنوات الخبره",
            value: "3 سنوات",
          ),
        ],
      ),
    );
  }
}

class MyServicesCard extends StatelessWidget {
  const MyServicesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [ShadowManager.cardShadow]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  ImageManager.banner,
                  width: context.width,
                  fit: BoxFit.cover,
                )),
            const Gap(15),
            Text(
              "عمل غرفة معيشه",
              style: TextStyleManager.style14BoldSec,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(8),
            Text(
              "تحتوي الغرفة على أريكة فاخرة بتنجيد مميز، طاولة قهوة خشبية بتفاصيل دقيقة، ووحدة تلفزيون أنيقة تناسب جميع المساحات",
              style: TextStyleManager.style14RegSec,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(8),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Text(
                "500 ج.م",
                style: TextStyleManager.style12BoldPrimary,
              ),
            ),
          ],
        ));
  }
}

class MyWorkCard extends StatelessWidget {
  const MyWorkCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [ShadowManager.cardShadow]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(ImageManager.banner,
                    width: context.width, fit: BoxFit.cover)),
            const Gap(15),
            Text(
              "عمل غرفة معيشه",
              style: TextStyleManager.style14BoldSec,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(8),
            Text(
              "تحتوي الغرفة على أريكة فاخرة بتنجيد مميز، طاولة قهوة خشبية بتفاصيل دقيقة، ووحدة تلفزيون أنيقة تناسب جميع المساحات",
              style: TextStyleManager.style14RegSec,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ));
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [ShadowManager.cardShadow]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset(
                  ImageManager.avatar,
                  height: context.responsiveHeight(46),
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(10),
              // user name
              Text(
                "محمد خالد",
                style: TextStyleManager.style14BoldSec,
              ),
            ],
          ),
          const Gap(18),
          Text(
            "وصف العمل وصف العمل وصف العمل وصف العمل وصف العمل وصف العمل وصف العمل وصف العمل وصف العمل وصف العمل وصف العمل وصف العمل وصف العمل وصف العمل",
            style: TextStyleManager.style12RegSec,
          ),
          const Gap(18),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star_rounded,
                    color: index != 4
                        ? Colors.amberAccent
                        : ColorManager.secondary,
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class PersonalDetailRow extends StatelessWidget {
  const PersonalDetailRow({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorManager.whiteShade),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyleManager.style14BoldPrimary,
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyleManager.style14BoldSec,
          ),
        ],
      ),
    );
  }
}
