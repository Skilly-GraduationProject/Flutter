import 'package:flutter/widgets.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/provider/home/data/models/get_requested_services_model/service.dart';
import 'package:grad_project/features/provider/home/data/models/home_banners/banner.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';

class ProviderHomeCubitState {
  // get provider profile state & data
  CubitState? getProviderProfileState;
  ProviderProfileModel? providerProfile;
  // users requested services state & data
  CubitState? getRequestedServicesState;
  List<Service> requestedServices;
  // home banners state & data
  CubitState? getHomeBannersState;
  List<HomeBanner> homeBanners;

  ProviderHomeCubitState({
    // get provider profile state & data
    this.getProviderProfileState = CubitState.initial,
    this.providerProfile,
    // users requested services state & data
    this.getRequestedServicesState = CubitState.initial,
    this.requestedServices = const [],
    // home banners state & data
    this.getHomeBannersState = CubitState.initial,
    this.homeBanners = const [],
  });

  ProviderHomeCubitState editState({
    // get provider profile state & data
    CubitState? getProviderProfileState,
    ProviderProfileModel? providerProfile,
    // users requested services state & data
    CubitState? getRequestedServicesState,
    List<Service>? requestedServices,
    // home banners state & data
    CubitState? getHomeBannersState,
    List<HomeBanner>? homeBanners,
  }) {
    return ProviderHomeCubitState(
      // get provider profile state & data
      getProviderProfileState:
          getProviderProfileState ?? this.getProviderProfileState,
      providerProfile: providerProfile ?? this.providerProfile,
      // users requested services state & data
      getRequestedServicesState:
          getRequestedServicesState ?? this.getRequestedServicesState,
      requestedServices: requestedServices ?? this.requestedServices,
      // home banners state & data
      getHomeBannersState: getHomeBannersState ?? this.getHomeBannersState,
      homeBanners: homeBanners ?? this.homeBanners,
    );
  }
}
