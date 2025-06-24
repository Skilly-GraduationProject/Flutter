import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/helper/shared_prefrences.dart';
import '../repos/auth_repo.dart';

class AddUserDataUseCase {
  final AuthRepo authRepo;
  AddUserDataUseCase({required this.authRepo});

  Future<Either<Failure, void>> call({
    required String govern,
    required String city,
    required String streetName,
    required int gender,
    required File image,
    required String token,
  }) async {
    final token = await loadToken();

    return await authRepo.addUserData(
        token: token!,
        govern: govern,
        city: city,
        streetName: streetName,
        gender: gender,
        image: image);
  }
}
