import 'package:bloc/bloc.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_gallery_model/servicesgallery.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/service.dart';
import 'package:grad_project/features/provider/provider_service.dart/data/repos/provider_service.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/manager/cubit/provider_service_state.dart';

class ProviderServiceCubit extends Cubit<ProviderServiceState> {
  ProviderServiceCubit({required this.providerServiceRepo})
      : super(ProviderServiceState());
  final ProviderServiceRepo providerServiceRepo;
  Future<void> getProviderService(String serviceId) async {
    emit(state.editState(getServiceState: CubitState.loading));
    final result = await providerServiceRepo.getProviderService(serviceId);
    result.fold(
      (failure) => emit(state.editState(getServiceState: CubitState.failure)),
      (service) => emit(state.editState(
          getServiceState: CubitState.success, service: service)),
    );
  }

  Future<void> getGalleryService(String serviceId) async {
    emit(state.editState(getGalleyServiceState: CubitState.loading));
    final result = await providerServiceRepo.getGalleryService(serviceId);
    result.fold(
      (failure) =>
          emit(state.editState(getGalleyServiceState: CubitState.failure)),
      (service) => emit(state.editState(
          getGalleyServiceState: CubitState.success, galleryService: service)),
    );
  }

  Future<void> addGalleryService(GalleryService galleryService) async {
    emit(state.editState(addGalleryServiceState: CubitState.loading));
    final result = await providerServiceRepo.addGalleryService(galleryService);
    result.fold(
      (failure) =>
          emit(state.editState(addGalleryServiceState: CubitState.failure)),
      (success) =>
          emit(state.editState(addGalleryServiceState: CubitState.success)),
    );
  }

  Future<void> deleteGalleryService(String serviceId) async {
    emit(state.editState(deleteServiceState: CubitState.loading));
    final result = await providerServiceRepo.deleteGalleryService(serviceId);
    result.fold(
      (failure) =>
          emit(state.editState(deleteServiceState: CubitState.failure)),
      (success) =>
          emit(state.editState(deleteServiceState: CubitState.success)),
    );
  }

  Future<void> deleteService(String serviceId) async {
    emit(state.editState(deleteServiceState: CubitState.loading));
    final result = await providerServiceRepo.deleteService(serviceId);
    result.fold(
      (failure) =>
          emit(state.editState(deleteServiceState: CubitState.failure)),
      (success) =>
          emit(state.editState(deleteServiceState: CubitState.success)),
    );
  }

  Future<void> updateService({required ProviderService service}) async {
    emit(state.editState(updateServiceState: CubitState.loading));
    final result = await providerServiceRepo.updateService(service);
    result.fold(
      (failure) =>
          emit(state.editState(updateServiceState: CubitState.failure)),
      (success) =>
          emit(state.editState(updateServiceState: CubitState.success)),
    );
  }
}
