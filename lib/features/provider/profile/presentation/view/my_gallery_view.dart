import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_gallery_model/servicesgallery.dart';
import 'package:grad_project/features/provider/profile/data/repos/provider_data_repo.dart';
import 'package:grad_project/features/provider/profile/presentation/manager/cubit/provider_data_cubit.dart';
import 'package:grad_project/features/provider/profile/presentation/manager/cubit/provider_data_state.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/my_gallery_card.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyWorkView extends StatelessWidget {
  const MyWorkView({super.key, required this.servicesgallery});
  final List<GalleryService>? servicesgallery;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProviderDataCubit(repo: getIt<ProviderDataRepo>())..getGallery(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
                          primary: true,
                          foregroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          surfaceTintColor: Colors.transparent,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          leading: const BackIcon(),
                          title: Text(
                            "اخر الاعمال",
                            style: TextStyleManager.style20BoldSec,
                          ),
                          centerTitle: true,
                        ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorManager.primary,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              GoRouter.of(context).push(RouterPath.addGalleryServiceView);
            },
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<ProviderDataCubit>().getGallery();
            },
            child: SafeArea(
                child: BlocBuilder<ProviderDataCubit, ProviderDataState>(
              builder: (context, state) {
                bool isLoading = state.getMyGalleryState == CubitState.loading;
                List<GalleryService>? servicesgallery =
                    state.getMyGalleryModel?.servicesgallery ??
                        this.servicesgallery;
                return Skeletonizer(
                  enabled: isLoading,
                  ignorePointers: isLoading,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.separated(
                      itemCount: servicesgallery!.length,
                      separatorBuilder: (context, index) => const Gap(10),
                      itemBuilder: (context, index) {
                        return MyGalleryCard(
                          servicesgallery: servicesgallery[index],
                        );
                      },
                    ),
                  ),
                );
              },
            )),
          ),
        );
      }),
    );
  }
}
