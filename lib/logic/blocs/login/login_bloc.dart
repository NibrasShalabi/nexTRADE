import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextrade/data/repositories/auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc(this.authRepository) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event,
      Emitter<LoginState> emit,
      ) async {
    emit(LoginLoading());

    try {
      final user = await authRepository.login(
        event.email.trim(),
        event.password.trim(),
      );

      emit(LoginSuccess(user.uid));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
