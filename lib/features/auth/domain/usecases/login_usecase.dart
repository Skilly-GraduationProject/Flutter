
import '../../data/models/auth_response.dart';
import '../repos/auth_repo.dart';

class LoginUseCase {
  final AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  Future<AuthResponse> call(
      {required int phone,
      required String password,
      required bool remember
      }) 
     async {
    return await authRepo.login(
        phone: phone, password: password,remember:remember );
  }
}
