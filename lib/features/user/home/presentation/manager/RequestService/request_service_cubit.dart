import 'dart:io';

import 'package:bloc/bloc.dart';

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
    List<File> images,
    double price,
  ) async {
    emit(RequestServiceInitial());
    try {
      var result = await requestServiceUseCase.call(
       
          deliveryTime: deliveryTime,
          name: name,
          notes: notes,
          category: category,
          video: video,
          startDate: startDate,
          images: images,
          price: price);
      print('request service cubit success $result');
      emit(RequestServiceSuccess());
    } catch (error) {
      print('request service cubit fails $error');
      emit(RequestServiceFailure(error.toString()));
    }
  }
}
