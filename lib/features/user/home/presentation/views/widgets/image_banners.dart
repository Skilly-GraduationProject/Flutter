import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import '../../../../../../core/managers/color_manager.dart';

class ImagesBanner extends StatefulWidget {
  final List<String> images;
  const ImagesBanner({super.key, required this.images});

  @override
  State<ImagesBanner> createState() => _ImagesBannerState();
}

class _ImagesBannerState extends State<ImagesBanner> {


  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return const SizedBox();
    }

        return
    Padding(
      padding: EdgeInsets.symmetric(horizontal: context.responsiveWidth(0)),
      child: Column(
        children: [
          CarouselSlider(
            items: widget.images.map((url) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  url
                 ,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              enlargeFactor: 0.9,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enlargeCenterPage: true,
              viewportFraction: 1,
              height: 200,
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
              scrollDirection: Axis.horizontal,
              itemCount: widget.images.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
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
            ),
          ),
        ],
      ),
    );
  }
}
