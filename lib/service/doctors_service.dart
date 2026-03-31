import 'package:dio/dio.dart';
import 'package:final_project/core/config/app_config.dart';
import 'package:final_project/core/config/di.dart';
import 'package:final_project/models/doctors_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorsService {
  Future<List<DoctorsModel>?> getAll() async {
    String baseUrl = AppConfig.baseUrl;
    final Dio _dio = Dio();
    try {
      Response response = await _dio.get(
        '$baseUrl/doctors',
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${getIt.get<SharedPreferences>().getString('token')}",
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        List<DoctorsModel> doctors = List.generate(
          response.data.length,
          (index) => DoctorsModel.fromMap(response.data[index]),
        );
        return doctors;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
