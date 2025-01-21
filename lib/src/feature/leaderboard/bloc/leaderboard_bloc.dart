import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_crescent/src/core/model/login_exception.dart';
import 'package:red_crescent/src/feature/leaderboard/data/leaderboard_repository.dart';
import 'package:red_crescent/src/feature/leaderboard/model/leaderboard.dart';

part 'leaderboard_state.dart';
part 'leaderboard_event.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc({
    required LeaderboardRepository leaderboardRepository
}) : _leaderboardRepository = leaderboardRepository, super(LeaderboardInitial()) {
    on<LeaderboardEvent> ((event, emit) => switch(event) {
      GetLeaderboard() => _onGetLoadUsers(event, emit),
    });
  }

  final LeaderboardRepository _leaderboardRepository;

  Future<void> _onGetLoadUsers(GetLeaderboard event, Emitter<LeaderboardState> emit) async {
    try {
      emit(LeaderboardLoading());
      final leaderboard = await _leaderboardRepository.getLeaderboard();
      emit(LeaderboardLoaded(leaderboard));
    } on LoginException catch (error, stackTrace) {
      emit(LeaderboardError('Ошибка авторизации: ${error.statusCode}'));
    } on Object catch (error, stackTrace) {
      emit(LeaderboardError('Произошла ошибка при загрузке данных'));
      onError(error, stackTrace);
    } finally {
      // ...
    }
  }

}

