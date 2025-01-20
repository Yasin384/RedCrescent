part of 'leaderboard_bloc.dart';

sealed class LeaderboardState  extends Equatable{
  const LeaderboardState();

  @override
  List<Object?> get props => [];
}

final class LeaderboardInitial extends LeaderboardState {}

final class LeaderboardLoading extends LeaderboardState {}

final class LeaderboardLoaded extends LeaderboardState {
  final UserResponse userResponse;
  const LeaderboardLoaded(this.userResponse);

  @override
  List<Object?> get props => [userResponse];
}

final class LeaderboardError extends LeaderboardState {
  final String message;
  const LeaderboardError(this.message);

  @override
  List<Object?> get props => [message];
}