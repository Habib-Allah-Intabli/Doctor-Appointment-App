import 'package:final_project/service/auth_service.dart';
import 'package:final_project/service/user_session_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(await SharedPreferences.getInstance());
  getIt.registerSingleton(AuthService());
  getIt.registerSingleton(
    UserSessionService(sharedPreferences: getIt<SharedPreferences>()),
  );
}
