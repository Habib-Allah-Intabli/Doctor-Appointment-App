import 'package:dio/dio.dart';
import 'package:final_project/core/config/app_config.dart';
import 'package:final_project/core/config/di.dart';
import 'package:final_project/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Dio dio = Dio();
  final String baseUrl = AppConfig.baseUrl;
  late Response response;
  Future<bool> login({required AuthModel authModel}) async {
    try {
      response = await dio.post("$baseUrl/login", data: authModel.toMap());
      print("📥 Login response status: ${response.statusCode}");
      print("📥 Login response data: ${response.data}"); // 🔥 شوفي شو جاي هنا

      if (response.statusCode == 200) {
        print("🔍 Full response: ${response.data}");
        print("🔍 Response keys: ${response.data.keys}");

        getIt.get<SharedPreferences>().setString(
          "token",
          response.data["token"],
        );
        print(response.data);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signout({required String token}) async {
    try {
      print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
      print("📤 Logout Request");
      print("📍 URL: $baseUrl/logout");
      print("🔑 Token: $token");
      print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

      Response response = await dio.post(
        "$baseUrl/logout",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            // 'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        print(response.data);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("❌ Logout error: $e");
      if (e is DioException) {
        print("❌ Error response: ${e.response?.data}");
        print("❌ Error status: ${e.response?.statusCode}");
        print("❌ Error headers: ${e.response?.headers}");
      }
      return false;
    }
  }
}
