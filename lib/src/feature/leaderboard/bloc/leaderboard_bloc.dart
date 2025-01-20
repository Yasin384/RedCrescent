import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_crescent/src/core/model/login_exception.dart';
import 'package:red_crescent/src/feature/leaderboard/data/leaderboard_repository.dart';
import 'package:red_crescent/src/feature/leaderboard/model/user_response.dart';

part 'leaderboard_state.dart';
part 'leaderboard_event.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc({
    required LeaderboardRepository leaderboardRepository
}) : _leaderboardRepository = leaderboardRepository, super(LeaderboardInitial()) {
    on<GetLeaderboard> ((event, emit) => _onGetLoadUsers(event, emit));
  }

  final LeaderboardRepository _leaderboardRepository;

  Future<void> _onGetLoadUsers(GetLeaderboard event, Emitter<LeaderboardState> emit) async {
    emit(LeaderboardLoading());
    try {
      final userResponse = await _leaderboardRepository.getLeaderboard();
      emit(LeaderboardLoaded(userResponse));
    } on LoginException catch (error, stackTrace) {
      emit(LeaderboardError('Ошибка авторизации: ${error.statusCode}'));
    } catch (error) {
      emit(LeaderboardError('Произошла ошибка при загрузке данных'));
    } finally {
      // ...
    }
  }

}

