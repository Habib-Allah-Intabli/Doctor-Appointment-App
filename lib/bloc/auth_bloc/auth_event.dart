part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final AuthModel authModel;

  LoginEvent({required this.authModel});
}

class SignOut extends AuthEvent {}
