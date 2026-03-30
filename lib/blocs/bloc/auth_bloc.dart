// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_project/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:final_project/models/auth_model.dart';
import 'package:final_project/service/auth_service.dart';

part 'auth_event.dart';

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
  }
}
