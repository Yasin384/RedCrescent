import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:red_crescent/src/core/model/access.dart';
import 'package:red_crescent/src/feature/auth/authorization/data/authorization_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc({
    required AuthorizationRepository authorizationRepository,
    AuthorizationState? authorizationState,
  })  : _authorizationRepository = authorizationRepository,
        super(authorizationState ?? UnAuthorized()) {
    on<AuthorizationEvent>(
      (event, emit) => switch (event) {
        // TODO: Handle this case.
        StartedListenAuthChanges() => _onStartedListenAuthChanges(event, emit),
        UnAuthoirized() => _onUnAuthoirzed(event, emit),
      },
      transformer: bloc_concurrency.concurrent(),
    );
  }

  Future<void> _onStartedListenAuthChanges(
      StartedListenAuthChanges event, Emitter<AuthorizationState> emit) async {
    return await emit.onEach(_authorizationRepository.accesSubj,
        onData: (access) {
      if (access != null) {
        emit(Authorized(access: access));
      } else {
        emit(UnAuthorized());
      }
    });
  }

  Future<void> _onUnAuthoirzed(
      UnAuthoirized event, Emitter<AuthorizationState> emit) async {
    await _authorizationRepository.unAuthorize();
  }

  final AuthorizationRepository _authorizationRepository;
}
