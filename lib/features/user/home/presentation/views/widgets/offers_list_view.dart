import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../manager/GetOffers/get_offers_cubit.dart';
import '../../manager/GetOffers/get_offers_states.dart';
import 'offer_card.dart';


class OffersListView extends StatefulWidget {
  const OffersListView({super.key, required this.orderId});
  final String orderId;

  @override
  State<OffersListView> createState() => _OffersListViewState();
}

class _OffersListViewState extends State<OffersListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetServiceOffersCubit>(context).getServiceOffers(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetServiceOffersCubit, GetServiceOffersStates>(
        builder: (context, state) {
      if (state is GetServiceOffersLoading) {
        return const SliverToBoxAdapter(child: CustomLoadingIndicator());
      } else if (state is GetServiceOffersSuccess) {
  final offers = state.offers;
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        final offer = offers[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: OfferCard(offer: offer),
        );
      },
      childCount: offers.length,
    ),
  );
}
 else if (state is GetServiceOffersFailure) {
        return SliverToBoxAdapter(child: Text(state.error));
      } else {
        return const SliverToBoxAdapter(child: Text('unknown'));
      }
    });
  }
}
