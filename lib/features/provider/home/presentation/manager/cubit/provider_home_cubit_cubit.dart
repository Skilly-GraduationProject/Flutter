// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:grad_project/core/utils/cubit_states.dart';

import 'package:grad_project/features/provider/home/data/repo/home_repo.dart';
import 'package:grad_project/features/provider/home/presentation/manager/cubit/provider_home_cubit_state.dart';

class ProviderHomeCubit extends Cubit<ProviderHomeCubitState> {
  ProviderHomeCubit({
    required this.homeRepo,
  }) : super(ProviderHomeCubitState());
  final ProviderHomeRepo homeRepo;

  Future<void> getProviderProfile() async {
    emit(state.editState(getProviderProfileState: CubitState.loading));
    var result = await homeRepo.getProviderProfile();
    result.fold(
        (failure) =>
            emit(state.editState(getProviderProfileState: CubitState.failure)),
        (model) => emit(state.editState(
            getProviderProfileState: CubitState.success,
            providerProfile: model)));
  }

  Future<void> getRequestedServices() async {
    emit(state.editState(getRequestedServicesState: CubitState.loading));
    var result = await homeRepo.getRequestedServices();
    result.fold(
        (l) => emit(
            state.editState(getRequestedServicesState: CubitState.failure)),
        (r) => emit(state.editState(
            getRequestedServicesState: CubitState.success,
            requestedServices: r.services)));
  }

  Future<void> getHomeBanners() async {
    emit(state.editState(getHomeBannersState: CubitState.loading));
    var result = await homeRepo.getHomeBanners();
    result.fold(
        (l) => emit(state.editState(getHomeBannersState: CubitState.failure)),
        (r) => emit(state.editState(
            getHomeBannersState: CubitState.success, homeBanners: r.banners)));
  }
}
