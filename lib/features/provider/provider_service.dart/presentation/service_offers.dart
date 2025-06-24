import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/buttons/secondary_button.dart';
import 'package:grad_project/core/widgets/show_custom_loading.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';
import 'package:grad_project/features/provider/provider_service.dart/data/repos/provider_service.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/manager/cubit/provider_service_cubit.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/manager/cubit/provider_service_state.dart';
import 'package:grad_project/features/provider/requested_service/data/models/offer_model.dart';
import 'package:grad_project/features/provider/requested_service/data/repo/service_repo.dart';
import 'package:grad_project/features/provider/requested_service/presentation/manager/cubit/service_cubit.dart';
import 'package:grad_project/features/provider/requested_service/presentation/manager/cubit/service_state.dart';

class ServiceOffersScreen extends StatelessWidget {
  final String serviceId;
  const ServiceOffersScreen({super.key, required this.serviceId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProviderServiceCubit(
              providerServiceRepo: getIt<ProviderServiceRepo>())
            ..getServiceOffers(serviceId),
        ),
        BlocProvider(
          create: (context) => ServiceCubit(serviceRepo: getIt<ServiceRepo>()),
        ),
      ],
      child: BlocListener<ServiceCubit, ServiceCubitState>(
        listener: (context, state) {
          if (state.acceptOfferState == CubitState.loading ||
              state.rejectOfferState == CubitState.loading) {
            showCustomLoading(context);
          } else if (state.acceptOfferState == CubitState.success) {
            context.pop();
            context.read<ProviderServiceCubit>().getServiceOffers(serviceId);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text(state.acceptOfferMessage ?? 'تم قبول العرض بنجاح'),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              ),
            );
          } else if (state.acceptOfferState == CubitState.failure) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text(state.acceptOfferError ?? 'حدث خطأ في قبول العرض'),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          } else if (state.rejectOfferState == CubitState.success) {
            context.pop();
            context.read<ProviderServiceCubit>().getServiceOffers(serviceId);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.acceptOfferMessage ?? 'تم رفض العرض بنجاح'),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        child: const ServiceOffersView(),
      ),
    );
  }
}

class ServiceOffersView extends StatelessWidget {
  const ServiceOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          primary: true,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: const BackIcon(),
          title: Text(
            "العروض",
            style: TextStyleManager.style20BoldSec,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<ProviderServiceCubit, ProviderServiceState>(
          builder: (context, state) {
            switch (state.getServiceOffersState) {
              case CubitState.loading:
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF00B9D4),
                  ),
                );
              case CubitState.success:
                final offers = state.offers ?? [];
                if (offers.isEmpty) {
                  return const Center(
                    child: Text(
                      'لا توجد عروض متاحة',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF232B55),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: offers.length,
                  itemBuilder: (context, index) {
                    final offer = offers[index];
                    return OfferCard(offer: offer);
                  },
                );
              case CubitState.failure:
                return const Center(
                  child: Text(
                    'حدث خطأ في تحميل العروض',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF232B55),
                    ),
                  ),
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final OfferModel offer;
  const OfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(offer.userImg),
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offer.userName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF232B55)),
                    ),
                    Text(
                      offer.deliverytime,
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFFB1B1B1)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(12),
          Text(
            offer.notes,
            style: const TextStyle(fontSize: 14, color: Color(0xFF232B55)),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(12),
          Row(
            children: [
              Text(
                '${offer.salary.toStringAsFixed(0)} ج.م',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF00B9D4)),
              ),
              const Spacer(),
              PrimaryButton(
                text: "قبول",
                width: context.responsiveWidth(90),
                onTap: () {
                  context.read<ServiceCubit>().acceptOffer(offerId: offer.id);
                },
              ),
              const SizedBox(width: 10),
              SecondaryButton(
                text: "رفض",
                width: context.responsiveWidth(90),
                onTap: () {
                  context.read<ServiceCubit>().acceptOffer(offerId: offer.id);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
