import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../repos/user_repo.dart';

class RequestServiceUseCase {
  final UserRepo userRepo;

  RequestServiceUseCase({required this.userRepo});

  Future<Either<Failure, void>> call(
      {required String token,
      required String deliveryTime,
      required String name,
      required String notes,
      required String category,
      required File? video,
      required String startDate,
      required List<File>?images,
      required double price}) async {
    return await userRepo.requestService(
      token: token,
      images: images,
        name: name,
        deliveryTime: deliveryTime,
        notes: notes,
        video: video,
        price: price,
        category: category,
        startDate: startDate);
  }
}
