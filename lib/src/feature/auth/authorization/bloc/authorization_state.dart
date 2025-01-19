part of 'authorization_bloc.dart';

@immutable
sealed class AuthorizationState extends Equatable {
  const AuthorizationState();

  bool get isAuthorized => switch (this) {
        Authorized _ => true,
        _ => false,
      };

  User? get user => switch (this) {
        Authorized authorized => authorized.access.user,
        _ => null
      };

  @override
  List<Object?> get props => [];
}

final class Authorized extends AuthorizationState {
  const Authorized({required this.access});

  final Access access;
  @override
  List<Object?> get props => [access];
}

final class UnAuthorized extends AuthorizationState {}
