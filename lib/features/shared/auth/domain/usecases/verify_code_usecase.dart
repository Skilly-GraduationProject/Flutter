import '../repos/auth_repo.dart';

class VerifyCodeUseCase {
  final AuthRepo authRepo;

  VerifyCodeUseCase({required this.authRepo});

  Future<void> call({required String code, required String email}) {
    return authRepo.verifyCode(code: code, email: email);
  }
}
