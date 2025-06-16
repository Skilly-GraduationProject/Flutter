import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/discount_service_card.dart';

import '../../../../../../core/helper/loading_indicator.dart';
import '../../manager/GetAllServices/get_all_services_cubit.dart';
import '../../manager/GetAllServices/get_all_services_states.dart';


class DiscountServicesListView extends StatefulWidget {
  const DiscountServicesListView({super.key});

  @override
  State<DiscountServicesListView> createState() =>
      _DiscountServicesListViewState();
}

class _DiscountServicesListViewState extends State<DiscountServicesListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllServicesCubit>(context).getAllServices('');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllServicesCubit, GetAllServicesStates>(
        builder: (context, state) {
      if (state is GetAllServicesLoading) {
        return const SliverToBoxAdapter(child: CustomLoadingIndicator());
      } else if (state is GetAllServicesSuccess) {
        final services = state.services.where((service) => service.discountPrice != null)
      .toList();

        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: services.map((service) {
                return SizedBox(
                  width: (MediaQuery.of(context).size.width) / 2.3,
                  child: DiscountServiceCard(
                    service: service,
                  ),
                );
              }).toList(),
            ),
          ),
        );
      } else if (state is GetAllServicesFailure) {
        return SliverToBoxAdapter(child: Text(state.error));
      } else {
        return const SliverToBoxAdapter(child: Text('unknown'));
      }
    });
  }
}
