part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LogoutRequested extends LoginEvent {
  const LogoutRequested();

  @override
  List<Object> get props => [];
}

final class Logged extends LoginEvent {
  const Logged({required this.userCredentialDto});

  final UserCredentialDto userCredentialDto;

  @override
  List<Object> get props => [userCredentialDto];
}
