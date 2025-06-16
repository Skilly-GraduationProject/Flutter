import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeToken(String token) async {
  SharedPreferences preference = await SharedPreferences.getInstance();
  await preference.setString('token', token);
  await preference.setBool('loggedIn', true);
}

Future<String?> loadToken() async {
  SharedPreferences preference = await SharedPreferences.getInstance();
  return preference.getString('token');
}

Future<void> saveUserProfile(String name, String img) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('userName', name);
  await prefs.setString('userImage', img);
}
