import 'package:final_project/bloc/auth_bloc/auth_bloc.dart';
import 'package:final_project/bloc/user_session_bloc/user_session_bloc.dart';
import 'package:final_project/core/config/di.dart';
import 'package:final_project/service/auth_service.dart';
import 'package:final_project/service/user_session_service.dart';
import 'package:final_project/views/nav_bar_view.dart';
import 'package:final_project/views/onboarding_view.dart';
import 'package:final_project/views/sign_in_view.dart';
import 'package:final_project/views/spalsh_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  getIt.get<SharedPreferences>().clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(442, 888),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  UserSessionBloc(getIt.get<UserSessionService>())
                    ..add(UserSessionCheckStatus()),
            ),
            BlocProvider(
              create: (context) => AuthBloc(getIt.get<AuthService>()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: BlocBuilder<UserSessionBloc, UserSessionState>(
              builder: (context, state) {
                switch (state) {
                  case UserSessionInitial():
                    return SplashView();
                  case UserFirstTimeState():
                    return OnboardingView();
                  case UserAuthenticated():
                    return NavBarView();
                  case UserUnAuth():
                    return SignInView();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
