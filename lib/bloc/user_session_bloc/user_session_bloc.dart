// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:final_project/core/config/di.dart';
import 'package:final_project/service/auth_service.dart';
import 'package:meta/meta.dart';

import 'package:final_project/service/user_session_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_session_event.dart';
part 'user_session_state.dart';

class UserSessionBloc extends Bloc<UserSessionEvent, UserSessionState> {
  UserSessionService userSessionService;
  UserSessionBloc(this.userSessionService) : super(UserSessionInitial()) {
    on<UserSessionCheckStatus>((event, emit) async {
      await Future.delayed(Duration(seconds: 6));
      if (userSessionService.isFirstTimeOpen()) {
        emit(UserFirstTimeState());
      } else {
        if (userSessionService.isAuthenticated()) {
          emit(UserAuthenticated());
        } else {
          emit(UserUnAuth());
        }
      }
    });
    on<Login>((event, emit) async {
      await userSessionService.saveToken(
        token: getIt.get<SharedPreferences>().getString("token")!,
      );
      emit(UserAuthenticated());
    });
    on<CompleteOnboarding>((event, emit) async {
      await userSessionService.completeOnboarding();
      emit(UserUnAuth());
    });
    on<Signout>((event, emit) async {
      // final token = getIt.get<SharedPreferences>().getString("token");
      // if (token != null) {
      //   await getIt.get<AuthService>().signout(token: token); // ← API call
      // }
      emit(UserUnAuth());
    });
  }
}
