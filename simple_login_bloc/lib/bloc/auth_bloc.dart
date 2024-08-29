import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_login_bloc/utils/text_validators.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  void _onLoginRequest(AuthLoginRequest event, Emitter emit) async {
    emit(AuthLoading());
    try {
      final String email = event.email;
      final String password = event.password;
      if (!isValidEmail(email)) {
        emit(AuthFailure("Email is not valid!"));
      } else if (!isValidPassword(password)) {
        emit(AuthFailure("Password is not valid!"));
      } else {
        await Future.delayed(
          const Duration(seconds: 2),
          () => emit(AuthSuccess("$email-$password")),
        );
      }
    } catch (error) {
      emit(AuthFailure("$error"));
    }
  }

  void _onLogoutRequest(AuthLogoutRequest event, Emitter emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(
        const Duration(seconds: 2),
        () => emit(AuthInitial()),
      );
    } catch (error) {
      emit(AuthFailure("$error"));
    }
  }

  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequest>(_onLoginRequest);
    on<AuthLogoutRequest>(_onLogoutRequest);
  }
}
