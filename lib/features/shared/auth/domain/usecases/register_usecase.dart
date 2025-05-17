import '../repos/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo authRepo;

  RegisterUseCase({required this.authRepo});

  Future<void> call({
    required String firstName,
    required String secondName,
    required String email,
    required String password,
    required String phone,
    required int userType,
  }) async {
    return await authRepo.register(
      firstName: firstName,
      secondName: secondName,
      phone: phone,
      email: email,
      password: password,
      userType: userType,
    );
  }
}
