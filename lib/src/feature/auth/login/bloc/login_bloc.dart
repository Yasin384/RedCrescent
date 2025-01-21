import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:red_crescent/src/core/model/login_exception.dart';
import 'package:red_crescent/src/feature/auth/authorization/data/authorization_repository.dart';
import 'package:red_crescent/src/feature/auth/login/data/login_repository.dart';
import 'package:red_crescent/src/feature/auth/login/model/user_credential_dto.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required LoginRepository loginRepository,
    required AuthorizationRepository authorizationRepository,
  })  : _loginRepository = loginRepository,
        _authorizationRepository = authorizationRepository,
        super(LoginInitial()) {
    on<LoginEvent>((event, emit) => switch (event) {
          Logged() => _onLogged(event, emit),
          LogoutRequested() => _onLogoutRequested(event, emit),
        });
  }

  final LoginRepository _loginRepository;

  final AuthorizationRepository _authorizationRepository;

  Future<void> _onLogged(Logged event, Emitter<LoginState> emit) async {
    try {
      emit(LoginInProgress());

      final access = await _loginRepository.login(event.userCredentialDto);

      await _authorizationRepository.authorize(access);

      emit(LoginCompleted());
    } on LoginException catch (error, stackTrace) {
      emit(LoginError(loginException: error));
      emit(LoginCompleted());
      onError(error, stackTrace);
      rethrow;
    } on Object catch (error, stackTrace) {
      Error.safeToString(error);
      stackTrace.toString();
      emit(LoginCompleted());
      onError(error, stackTrace);
      rethrow;
    } finally {
      // ...
    }
  }

  Future<void> _onLogoutRequested(LogoutRequested event, Emitter<LoginState> emit) async {
    try {
      await _authorizationRepository.unAuthorize();
    } catch(error, stackTrace) {
      onError(error, stackTrace);
      rethrow;
    }
  }
}
