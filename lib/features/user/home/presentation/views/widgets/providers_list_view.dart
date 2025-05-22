import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/user/home/presentation/manager/GetCategoryServiceProviders/get_category_service_providers_cubit.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../../domain/entities/service_providers_entity.dart';
import '../../manager/GetCategoryServiceProviders/get_category_service_providers_states.dart';
import 'provider_container.dart';

class ProvidersListView extends StatefulWidget {
  const ProvidersListView({super.key, required this.categoryId});
  final String categoryId;

  @override
  State<ProvidersListView> createState() => _ProvidersListViewState();
}

class _ProvidersListViewState extends State<ProvidersListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetCategoryServiceProvidersCubit>(context)
        .getCategoryServiceProviders(categoryId: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryServiceProvidersCubit,
        GetCategoryServiceProvidersStates>(builder: (context, state) {
      if (state is GetCategoryServiceProvidersLoading) {
        return const CustomLoadingIndicator();
      } else if (state is GetCategoryServiceProvidersSuccess) {
        final providers = state.providers;
        return ListView.separated(
            itemCount: providers.length,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
              final ServiceProvidersEntity provider = providers[index];
              return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffF6F7F9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: ProviderContainer(
                    name: provider.fullName,
                    img: provider.img,
                  ));
            });
      } else if (state is GetCategoryServiceProvidersFailure) {
        return Text(state.error);
      } else {
        return const Text('unknown');
      }
    });
  }
}
