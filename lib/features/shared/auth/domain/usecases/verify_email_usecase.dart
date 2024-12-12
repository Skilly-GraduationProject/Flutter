import '../repos/auth_repo.dart';

class VerifyEmailUseCase {
  final AuthRepo authRepo;

  VerifyEmailUseCase({required this.authRepo});

  Future<void> call({required String code, required String email}) {
    return authRepo.verifyEmail(code: code, email: email);
  }
}
