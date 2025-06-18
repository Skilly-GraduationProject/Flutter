import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/provider/requested_service/data/models/add_service_model/add_service_model.dart';
import 'package:grad_project/features/provider/requested_service/data/models/add_service_model/data.dart';
import 'package:grad_project/features/provider/requested_service/data/models/offer_model/send_offer_model.dart';
import 'package:grad_project/features/provider/requested_service/data/repo/service_repo.dart';
import 'package:grad_project/features/provider/requested_service/presentation/manager/cubit/service_state.dart';

class ServiceCubit extends Cubit<ServiceCubitState> {
  ServiceCubit({required this.serviceRepo}) : super(const ServiceCubitState());
  final ServiceRepo serviceRepo;

  Future<void> addService({required AddedService serviceModel}) async {
    emit(state.copyWith(addServiceState: CubitState.loading));
    final result = await serviceRepo.addService(serviceModel: serviceModel);
    result.fold(
      (l) => emit(
        state.copyWith(
          addServiceState: CubitState.failure,
        ),
      ),
      (r) => emit(
        state.copyWith(addServiceState: CubitState.success, addServiceModel: r),
      ),
    );
  }

  Future<void> sendOffer({required SendOfferModel offerModel}) async {
    emit(state.copyWith(sendOfferState: CubitState.loading));
    final result = await serviceRepo.sendOffer(offerModel: offerModel);
    result.fold(
      (l) => emit(
        state.copyWith(
          sendOfferState: CubitState.failure,
          sendOfferError: l.errMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          sendOfferState: CubitState.success,
        ),
      ),
    );
  }
}
