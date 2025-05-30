import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'emergency_offer_card.dart';
import '../../manager/GetEmergencyProviders/get_emergency_providers_cubit.dart';
import '../../manager/GetEmergencyProviders/get_emergency_providers_states.dart';
import '../../../domain/entities/emergency_providers_entity.dart';

class EmergencyOffersListView extends StatelessWidget {
  final void Function(int) onReject;
  final void Function(EmergencyProvidersEntity) onAccept;

  const EmergencyOffersListView({
    super.key,
    required this.onReject,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetEmergencyProvidersCubit, GetEmergencyProvidersStates>(
      builder: (context, state) {
        if (state is GetEmergencyProvidersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetEmergencyProvidersSuccess) {
          final offers = state.offers;

          return Padding(
            padding: const EdgeInsets.only(top: 60),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: offers.length,
              itemBuilder: (context, index) {
                final offer = offers[index];
                return EmergencyOfferCard(
                  offer: offer,
                  onReject: () => onReject(index),
                  onAccept: () => onAccept(offer),
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
