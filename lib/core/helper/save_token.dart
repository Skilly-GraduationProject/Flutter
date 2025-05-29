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
