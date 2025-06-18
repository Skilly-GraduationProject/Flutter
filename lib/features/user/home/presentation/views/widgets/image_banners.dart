import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/widgets/custom_network_image.dart';
import 'package:grad_project/core/widgets/show_image.dart';
import 'package:grad_project/features/provider/home/data/models/home_banners/banner.dart';

class HomeBanners extends StatefulWidget {
  const HomeBanners({
    super.key,
    this.banners = const [],
  });
  final List<HomeBanner> banners;
  @override
  State<HomeBanners> createState() => _HomeBannersState();
}

class _HomeBannersState extends State<HomeBanners> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.responsiveWidth(0)),
      child: Column(
        children: [
          CarouselSlider(
            items: widget.banners.map((b) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: context.width,
                  child: GestureDetector(
                    onTap: () {
                      showMultiImages(
                          context: context,
                          images:
                              widget.banners.map((e) => e.imagePath!).toList());
                    },
                    child: CustomNetworkImage(
                      image: b.imagePath!,
                      fit: BoxFit.cover,
                      width: context.width,
                    ),
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              enlargeFactor: 0.9,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              enlargeCenterPage: true,
              viewportFraction: 1,
              height: context.responsiveHeight(127),
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          const Gap(12),
          SizedBox(
            height: 8,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? ColorManager.primary
                      : ColorManager.darkGrey,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              itemCount: widget.banners.length,
            ),
          )
        ],
      ),
    );
  }
}
