
import '../repos/auth_repo.dart';

class ResetPassUseCase {
  final AuthRepo authRepo;

  ResetPassUseCase({required this.authRepo});

  Future<void> call(
      {required String pass,
      required String confirmPass,
      required String email}) async {
    return await authRepo.resetPass(
        pass: pass, confirmPass: confirmPass, email: email);
  }
}
