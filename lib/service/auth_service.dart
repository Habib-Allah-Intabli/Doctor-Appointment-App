import 'package:dio/dio.dart';
import 'package:final_project/core/config/api_constants.dart';
import 'package:final_project/core/config/di.dart';
import 'package:final_project/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Dio dio = Dio();
  final String baseUrl = ApiConstants.baseUrl;
  late Response response;
  Future<bool> login({required AuthModel authModel}) async {
    try {
      response = await dio.post("$baseUrl/login", data: authModel.toMap());
      if (response.statusCode == 200) {
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
      Response response = await dio.post(
        "$baseUrl/logout",
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
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
}
