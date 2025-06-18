import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/auth_response.dart';

abstract class AuthRepo {
  Future<AuthResponse> login(
      {required String password,
      required String phone,
      required bool remember});
        Future<void> loginWithGoogle(
      {required String idToken});
  Future<void> register({
    required String firstName,
    required String secondName,
    required String email,
    required String password,
    required String phone,
    required int userType,
  });
  Future<void> forgetPass({required String email});
  Future<void> updatePass(
      {required String pass,
      required String confirmPass,
      required String email});
  Future<void> verifyEmail({required String code, required String email});
  Future<void> verifyCode({required String code, required String email});
  Future<Either<Failure, void>> addUserData({
    required String token,
    required String govern,
    required String city,
    required String streetName,
    required int gender,
    required File image,
  });
  Future<Either<Failure, void>> addProviderData({
    required String token,
    required String categoryId,
    required String govern,
    required String city,
    required String streetName,
    required int age,
    required int yearsOfExp,
    required int gender,
    required File image,
    required File pdf,
    required String briefSummary,

  });
}
