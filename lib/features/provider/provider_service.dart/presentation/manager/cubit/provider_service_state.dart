import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_gallery_model/servicesgallery.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/service.dart';

class ProviderServiceState {
  final CubitState? getServiceState;
  final ProviderService? service;
  final CubitState? getGalleyServiceState;
  final GalleryService? galleryService;
  final CubitState? deleteServiceState;
  final CubitState? updateServiceState;
  final CubitState? addGalleryServiceState;

  ProviderServiceState({
    this.getServiceState,
    this.service,
    this.getGalleyServiceState,
    this.galleryService,
    this.deleteServiceState,
    this.updateServiceState,
    this.addGalleryServiceState,
  });

  ProviderServiceState editState({
    CubitState? getServiceState,
    ProviderService? service,
    CubitState? getGalleyServiceState,
    GalleryService? galleryService,
    CubitState? deleteServiceState,
    CubitState? updateServiceState,
    CubitState? addGalleryServiceState,
  }) {
    return ProviderServiceState(
      getServiceState: getServiceState ?? this.getServiceState,
      service: service ?? this.service,
      getGalleyServiceState:
          getGalleyServiceState ?? this.getGalleyServiceState,
      galleryService: galleryService ?? this.galleryService,
      deleteServiceState: deleteServiceState ?? this.deleteServiceState,
      updateServiceState: updateServiceState ?? this.updateServiceState,
      addGalleryServiceState:
          addGalleryServiceState ?? this.addGalleryServiceState,
    );
  }
}
