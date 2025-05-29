
import '../../../../../core/helper/save_token.dart';
import '../repos/auth_repo.dart';

class AddUserDataUseCase {
  final AuthRepo authRepo;
  AddUserDataUseCase({required this.authRepo});

  Future<void> call({
    required String govern,
    required String city,
    required String streetName,
    required int gender,
    required String image,
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
