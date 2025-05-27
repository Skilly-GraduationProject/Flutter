import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/core/widgets/show_image.dart';
import 'package:grad_project/features/provider/home/data/models/get_requested_services_model/service.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
    required this.images,
  });
  final List<dynamic>? images;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<dynamic> images = widget.images ?? [];
    print("images: $images");
    return images.isNotEmpty
        ? Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.responsiveWidth(0)),
            child: Column(
              children: [
                CarouselSlider(
                  items: images.map((b) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        width: context.width,
                        child: GestureDetector(
                          onTap: () {
                            showMultiImages(
                                context: context,
                                images:
                                    images.map((e) => e.toString()).toList());
                          },
                          child: CustomImage(
                            image: b.image,
                            fit: BoxFit.cover,
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
                    height: context.responsiveHeight(200),
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
                    itemCount: images.length,
                  ),
                )
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
