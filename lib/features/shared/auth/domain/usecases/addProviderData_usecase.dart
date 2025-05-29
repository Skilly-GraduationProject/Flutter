import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/helper/shared_prefrences.dart';
import '../repos/auth_repo.dart';

class AddProviderDataUseCase {
  final AuthRepo authRepo;
  AddProviderDataUseCase({required this.authRepo});

  Future<Either<Failure, void>> call({
    required String govern,
    required String city,
    required String streetName,
    required int age,
    required int yearsOfExp,
    required int gender,
    required File image,
    required File pdf,
    required String categoryId,
    required String briefSummary,
    required String token,
  }) async {
    final token = await loadToken();

    return await authRepo.addProviderData(
      token: token!,
      categoryId: categoryId,
      govern: govern,
      city: city,
      streetName: streetName,
      age: age,
      yearsOfExp: yearsOfExp,
      gender: gender,
      image: image,
      pdf: pdf,
      briefSummary: briefSummary,
    );
  }
}
