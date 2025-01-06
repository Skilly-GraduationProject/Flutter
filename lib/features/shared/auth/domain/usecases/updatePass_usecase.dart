
import '../repos/auth_repo.dart';

class UpdatePassUseCase {
  final AuthRepo authRepo;

  UpdatePassUseCase({required this.authRepo});

  Future<void> call(
      {required String pass,
      required String confirmPass,
      required String email}) async {
    return await authRepo.updatePass(
        pass: pass, confirmPass: confirmPass, email: email);
  }
}
