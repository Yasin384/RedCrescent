part of 'authorization_bloc.dart';

@immutable
sealed class AuthorizationEvent {}

final class StartedListenAuthChanges extends AuthorizationEvent {}

final class UnAuthoirized extends AuthorizationEvent {}
