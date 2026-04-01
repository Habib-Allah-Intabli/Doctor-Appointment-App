import 'package:dio/dio.dart';
import 'package:final_project/core/config/api_constants.dart';
import 'package:final_project/core/config/di.dart';
import 'package:final_project/models/doctors_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorsService {
  Future<List<DoctorsModel>?> getAll() async {
    String baseUrl = ApiConstants.baseUrl;
    final Dio _dio = Dio();
    try {
      final token = getIt.get<SharedPreferences>().getString('token');
      print(token);
      Response response = await _dio.get(
        '$baseUrl/doctors',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<DoctorsModel> doctors = List.generate(
          response.data.length,
          (index) => DoctorsModel.fromMap(response.data[index]),
        );
        // print(response.data);
        return doctors;
      } else {
        return null;
      }
    } on DioException catch (e) {
      print(e);
      return null;
    }
  }
}
