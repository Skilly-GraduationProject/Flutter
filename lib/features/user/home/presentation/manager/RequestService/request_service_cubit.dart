import 'dart:io';

import 'package:bloc/bloc.dart';

import '../../../../../../core/helper/shared_prefrences.dart';
import '../../../domain/usecases/request_service_usecase.dart';
import 'request_service_states.dart';

class RequestServiceCubit extends Cubit<RequestServiceStates> {
  RequestServiceCubit(this.requestServiceUseCase)
      : super(RequestServiceInitial());
  final RequestServiceUseCase requestServiceUseCase;

  Future<void> requestService(
    String deliveryTime,
    String name,
    String notes,
    String category,
    File? video,
    String startDate,
    List<File>? images,
    double price,
  ) async {
    emit(RequestServiceLoading());
    final token = await loadToken();

    var result = await requestServiceUseCase.call(
      token: token!,
      deliveryTime: deliveryTime,
      name: name,
      notes: notes,
      category: category,
      video: video,
      startDate: startDate,
      images: images,
      price: price,
    );
    result.fold((failure) {
      emit(RequestServiceFailure(failure.errMessage));
      print('request service cubit fails ${failure.errMessage}');
    }, (data) {
      print('request service cubit success $result');
      emit(RequestServiceSuccess());
    });
  }
}
