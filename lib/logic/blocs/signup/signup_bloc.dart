import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextrade/data/repositories/auth_repository.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;

  SignUpBloc(this.authRepository) : super(SignUpInitial()) {
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  Future<void> _onSignUpSubmitted(
      SignUpSubmitted event,
      Emitter<SignUpState> emit,
      ) async {
    emit(SignUpLoading());

    try {
      final user = await authRepository.signUp(
        name: event.name.trim(),
        email: event.email.trim(),
        password: event.password.trim(),
        referralCode: event.referralCode?.trim(),
      );

      emit(SignUpSuccess(user.uid));
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }
}
