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
  }) async {
    return await authRepo.addUserData(
        govern: govern,
        city: city,
        streetName: streetName,
        gender: gender,
        image: image);
  }
}
