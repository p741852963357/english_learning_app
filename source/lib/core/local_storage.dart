import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final String email = "email";

  Future getUserInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(email);
  }

  Future setUserInfo(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(this.email, email);
  }

  Future<void> clearUserInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(email);
  }
}
