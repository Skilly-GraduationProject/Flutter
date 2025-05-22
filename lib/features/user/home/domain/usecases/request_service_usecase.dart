import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../repos/user_repo.dart';

class RequestServiceUseCase {
  final UserRepo userRepo;

  RequestServiceUseCase({required this.userRepo});

  Future<Either<Failure, void>> call(
      {
      required String deliveryTime,
      required String name,
      required String notes,
      required String category,
      required File? video,
      required String startDate,
      required List<File>images,
      required double price}) async {
    return await userRepo.requestService(
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImFiOTVlZDI2LTAzODAtNGMzMC05Y2M4LTU0MjRlN2U3YmY5NCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL21vYmlsZXBob25lIjoiMDEyMjE2NDMxOTUiLCJqdGkiOiI3M2IzMDk0YS0xZDQyLTQwZmEtYThmNC1mMGQ2MGE4NGU4NTciLCJleHAiOjE3NDg1MzExOTQsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI3MSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.HFe0kcwr0MUpBNBjWWRC2U3I-7E5Iob5z_dvrcGgTGg' ,
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
