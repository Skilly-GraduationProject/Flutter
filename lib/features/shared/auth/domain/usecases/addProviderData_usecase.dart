import '../repos/auth_repo.dart';

class AddProviderDataUseCase {
  final AuthRepo authRepo;
  AddProviderDataUseCase({required this.authRepo});

  Future<void> call({
    required String govern,
    required String city,
    required String streetName,
    required String age,
    required String yearsOfExp,
    required int gender,
    required String image,
    required String briefSummary,
    required String profession,
  }) async {
    return await authRepo.addProviderData(
        govern: govern,
        city: city,
        streetName: streetName,
        age: age,
        yearsOfExp: yearsOfExp,
        gender: gender,
        image: image,
        briefSummary: briefSummary,
        profession: profession);
  }
}
