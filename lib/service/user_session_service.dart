import 'package:shared_preferences/shared_preferences.dart';

class UserSessionService {
  final String _firstTimeOpenKey = "first_time";
  final String _token = "token";
  SharedPreferences sharedPreferences;
  UserSessionService({required this.sharedPreferences});

  bool isFirstTimeOpen() =>
      sharedPreferences.getBool(_firstTimeOpenKey) ?? true;

  bool isAuthenticated() {
    bool hasToken = !(sharedPreferences.getString(_token) == null);
    return hasToken;
  }

  Future<void> completeOnboarding() async {
    await sharedPreferences.setBool(_firstTimeOpenKey, false);
  }

  Future<void> saveToken({required String token}) async {
    await sharedPreferences.setString(_token, token);
  }

  Future<void> clearToken() async {
    await sharedPreferences.remove(_token);
  }
}
