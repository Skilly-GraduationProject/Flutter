import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/emergency_providers_entity.dart';
import '../../manager/RejectEOffer/rejcet_e_offer_cubit.dart';
import 'emergency_offer_card.dart';
import '../../manager/GetEmergencyProviders/get_emergency_providers_cubit.dart';
import '../../manager/GetEmergencyProviders/get_emergency_providers_states.dart';

class EmergencyOffersListView extends StatefulWidget {
  const EmergencyOffersListView({
    super.key,
  });

  @override
  State<EmergencyOffersListView> createState() =>
      _EmergencyOffersListViewState();
}

class _EmergencyOffersListViewState extends State<EmergencyOffersListView> {
  List<EmergencyProvidersEntity> myOffers = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetEmergencyProvidersCubit, GetEmergencyProvidersStates>(
      builder: (context, state) {
        if (state is GetEmergencyProvidersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetEmergencyProvidersSuccess) {
          if (myOffers.isEmpty) {
            myOffers = List.from(state.offers);
          }

          return Padding(
            padding: const EdgeInsets.only(top: 60),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: myOffers.length,
              itemBuilder: (context, index) {
                final offer = myOffers[index];
                return EmergencyOfferCard(
                  offer: offer,
                  onReject: () {
                    BlocProvider.of<RejectEOfferCubit>(context)
                        .rejectEOffer(offer.requestId, offer.providerId)
                        .then((_) {
                      setState(() {
                        myOffers.removeAt(index);
                      });
                    });
                  },
                );
              },
            ),
          );
        } else if (state is GetEmergencyProvidersSuccess &&
            state.offers.isEmpty) {
          return const Center(child: Text('لا توجد عروض حالياً'));
        } else if (state is GetEmergencyProvidersFailure) {
          return Center(child: Text('حدث خطأ: ${state.error}'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
