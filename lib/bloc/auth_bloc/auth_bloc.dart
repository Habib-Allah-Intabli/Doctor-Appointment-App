// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_project/bloc/user_session_bloc/user_session_bloc.dart';
import 'package:final_project/core/config/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:final_project/models/auth_model.dart';
import 'package:final_project/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthService authService;
  AuthBloc(this.authService) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      bool isLogged = await authService.login(authModel: event.authModel);
      emit(
        isLogged
            ? AuthSuccess()
            : AuthError(
                errorMessage:
                    "failed to login, plesae check your information and try again...",
              ),
      );
    });
    on<SignOut>((event, emit) async {
      emit(AuthLoading());
      try {
        final prefs = getIt.get<SharedPreferences>();
        final token = prefs.getString('token');
        if (token != null) {
          final success = await authService.signout(token: token);

          if (success) {
            await prefs.remove('token');
            getIt.get<UserSessionBloc>().add(Signout());
            emit(AuthSuccess());
          } else {
            emit(AuthError(errorMessage: 'Failed to logout'));
          }
        } else {
          emit(AuthError(errorMessage: 'No active session found'));
        }
      } catch (e) {
        emit(AuthError(errorMessage: 'Error during logout: $e'));
      }
    });
  }
}
