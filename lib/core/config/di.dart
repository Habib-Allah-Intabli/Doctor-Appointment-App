import 'package:final_project/bloc/user_session_bloc/user_session_bloc.dart';
import 'package:final_project/service/auth_service.dart';
import 'package:final_project/service/cart_local_data_source.dart';
import 'package:final_project/service/doctors_service.dart';
import 'package:final_project/service/hospital_service.dart';
import 'package:final_project/service/user_session_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(await SharedPreferences.getInstance());
  getIt.registerSingleton(CartLocalDataSource());
  getIt.registerSingleton(HospitalService());
  getIt.registerSingleton(DoctorsService());
  getIt.registerSingleton(AuthService());
  getIt.registerSingleton(
    UserSessionService(sharedPreferences: getIt<SharedPreferences>()),
  );
  getIt.registerSingleton(UserSessionBloc(getIt.get<UserSessionService>()));
}
