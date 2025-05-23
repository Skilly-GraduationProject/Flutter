import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/discount_service_card.dart';

import '../../../../../../core/helper/loading_indicator.dart';
import '../../manager/GetDiscountServices/get_discount_services_cubit.dart';
import '../../manager/GetDiscountServices/get_discount_services_states.dart';

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
    BlocProvider.of<GetDiscountServicesCubit>(context)
        .getDiscountServices('');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDiscountServicesCubit, GetDiscountServicesStates>(
        builder: (context, state) {
      if (state is GetDiscountServicesLoading) {
        return const SliverToBoxAdapter(child: CustomLoadingIndicator());
      } else if (state is GetDiscountServicesSuccess) {
        final services = state.services;

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
                    discountPrice: service.discountPrice,
                    img: service.images.isNotEmpty ? service.images.first : '',
                    name: service.name,
                    price: service.price,
                  ),
                );
              }).toList(),
            ),
          ),
        );
      } else if (state is GetDiscountServicesFailure) {
        return SliverToBoxAdapter(child: Text(state.error));
      } else {
        return const SliverToBoxAdapter(child: Text('unknown'));
      }
    });
  }
}
