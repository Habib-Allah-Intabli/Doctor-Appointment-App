import 'package:dio/dio.dart';
import 'package:final_project/core/config/api_constants.dart';
import 'package:final_project/core/config/di.dart';
import 'package:final_project/models/doctors_model.dart';
import 'package:final_project/models/hospital_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HospitalService {
  Future<List<HospitalModel>?> getAll() async {
    String baseUrl = ApiConstants.baseUrl;
    final Dio _dio = Dio();
    try {
      final token = getIt.get<SharedPreferences>().getString('token');
      print(token);
      Response response = await _dio.get(
        '$baseUrl/hospitals',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200) {
        List<HospitalModel> hospitals = List.generate(
          response.data.length,
          (index) => HospitalModel.fromMap(response.data[index]),
        );
        // print(response.data);
        return hospitals;
      } else {
        return null;
      }
    } on DioException catch (e) {
      print(e);
      return null;
    }
  }
}
