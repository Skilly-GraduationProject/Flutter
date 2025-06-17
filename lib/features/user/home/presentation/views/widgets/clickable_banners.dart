import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../manager/GetBanners/get_banners_cubit.dart';
import '../../manager/GetBanners/get_banners_states.dart';

class ClickableBanners extends StatefulWidget {
  const ClickableBanners({super.key});

  @override
  State<ClickableBanners> createState() => _ClickableBannersState();
}

class _ClickableBannersState extends State<ClickableBanners> {
  void launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $url");
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetBannersCubit>(context).getBanners();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBannersCubit, GetBannersStates>(
      builder: (context, state) {
        if (state is GetBannersLoading) {
          return const CustomLoadingIndicator();
        } else if (state is GetBannersSuccess) {
          final banners = state.banners;
          print('banners $banners');
          return CarouselSlider(
            items: banners.map((banner) {
              return GestureDetector(
                onTap: () => launchURL(banner.imgUrl),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    banner.img,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: 150,
              enlargeCenterPage: true,
              viewportFraction: 1,
            ),
          );
        } else if (state is GetBannersFailure) {
          return Text('Error: ${state.error}');
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
