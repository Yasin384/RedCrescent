part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  bool get isLoginInProgress => switch (this) {
        LoginInProgress _ => true,
        _ => false,
      };

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginInProgress extends LoginState {}

final class LoginCompleted extends LoginState {}

final class LoginError extends LoginState {
  const LoginError({required this.loginException});

  final LoginException loginException;

  @override
  // TODO: implement props
  List<Object> get props => [loginException];
}
