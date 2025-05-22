import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/offered_service_card.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../manager/GetAllServices/get_all_services_cubit.dart';
import '../../manager/GetAllServices/get_all_services_states.dart';

class HomeServicesListView extends StatefulWidget {
  const HomeServicesListView({super.key});

  @override
  State<HomeServicesListView> createState() => _HomeServicesListViewState();
}

class _HomeServicesListViewState extends State<HomeServicesListView> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllServicesCubit>().getAllServices('');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllServicesCubit, GetAllServicesStates>(
        builder: (context, state) {
      if (state is GetAllServicesLoading) {
        return const CustomLoadingIndicator();
      } else if (state is GetAllServicesSuccess) {
        final services = state.services;
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: services.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemBuilder: (context, index) {
            return OfferedServiceCard(service: services[index]);
          },
        );
      } else if (state is GetAllServicesFailure) {
        return Text(state.error);
      } else {
        return const Text('unknown');
      }
    });
  }
}
