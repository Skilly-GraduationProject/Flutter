import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/provider/requested_service/data/models/add_service_model/add_service_model.dart';
import 'package:grad_project/features/provider/requested_service/data/models/add_service_model/data.dart';
import 'package:grad_project/features/provider/requested_service/data/models/offer_model.dart';
import 'package:grad_project/features/provider/requested_service/data/models/offer_model/send_offer_model.dart';
import 'package:grad_project/features/provider/requested_service/data/repo/service_repo.dart';
import 'package:grad_project/features/provider/requested_service/presentation/manager/cubit/service_state.dart';

class ServiceCubit extends Cubit<ServiceCubitState> {
  ServiceCubit({required this.serviceRepo}) : super(const ServiceCubitState());
  final ServiceRepo serviceRepo;
  Future<void> getRequestedService({required String serviceId}) async {
    emit(state.copyWith(getRequestedServiceState: CubitState.loading));
    final result = await serviceRepo.getRequestedService(serviceId: serviceId);
    result.fold(
        (l) => emit(
              state.copyWith(
                getRequestedServiceState: CubitState.failure,
              ),
            ), (r) {
      print("service name : ${r.name}");

      emit(
        state.copyWith(
          getRequestedServiceState: CubitState.success,
          getRequestedServiceModel: r,
        ),
      );
    });
  }

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

  Future<void> getOffer({required String offerId}) async {
    emit(state.copyWith(getOfferState: CubitState.loading));
    final result = await serviceRepo.getOffer(offerId: offerId);
    result.fold(
      (l) => emit(
        state.copyWith(
          getOfferState: CubitState.failure,
          getOfferError: l.errMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getOfferState: CubitState.success,
          offerModel: r,
        ),
      ),
    );
  }

  Future<void> acceptOffer({required String offerId}) async {
    emit(state.copyWith(acceptOfferState: CubitState.loading));
    final result = await serviceRepo.acceptOffer(offerId: offerId);
    result.fold(
      (l) => emit(
        state.copyWith(
          acceptOfferState: CubitState.failure,
          acceptOfferError: l.errMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          acceptOfferState: CubitState.success,
          acceptOfferMessage: r,
        ),
      ),
    );
  }

  Future<void> rejectOffer({required String offerId}) async {
    emit(state.copyWith(rejectOfferState: CubitState.loading));
    final result = await serviceRepo.rejectOffer(offerId: offerId);
    result.fold(
      (l) => emit(
        state.copyWith(
          rejectOfferState: CubitState.failure,
          rejectOfferError: l.errMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          rejectOfferState: CubitState.success,
          rejectOfferMessage: r,
        ),
      ),
    );
  }

  Future<void> acceptService({required String requestId}) async {
    emit(state.copyWith(acceptServiceState: CubitState.loading));
    final result = await serviceRepo.acceptService(requestId: requestId);
    result.fold(
      (l) => emit(
        state.copyWith(
          acceptServiceState: CubitState.failure,
          acceptServiceError: l.errMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          acceptServiceState: CubitState.success,
          acceptServiceMessage: r,
        ),
      ),
    );
  }
}
