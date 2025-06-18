import '../repos/auth_repo.dart';

class LoginWithGoogleUseCase {
  final AuthRepo authRepo;

  LoginWithGoogleUseCase({required this.authRepo});

  Future<void> call({
    required String idToken
  }) async {
    return await authRepo.loginWithGoogle(idToken: idToken,);
  }
}
