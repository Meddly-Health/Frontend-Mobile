import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:form_helper/form_helper.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);

    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  Future<void> logInWithCredentials() async {
    emit(state.copyWith(
        status: FormzStatus.submissionInProgress, isGoogleSignIn: false));
    if (!state.status.isValidated) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: 'Invalid credentials'));
      return;
    }
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value.trim().toLowerCase(),
        password: state.password.value.trim(),
      );

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(state.copyWith(
        errorMessage: e.message,
        status: FormzStatus.submissionFailure,
      ));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> logInWithGoogle() async {
    try {
      emit(state.copyWith(
          status: FormzStatus.submissionInProgress, isGoogleSignIn: true));
      await _authenticationRepository.logInWithGoogle();

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on LogInWithGoogleFailure catch (e) {
      emit(state.copyWith(
        errorMessage: e.message,
        status: FormzStatus.submissionFailure,
      ));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> logOUt() async {
    try {
      await _authenticationRepository.logOut();
      emit(state.copyWith(status: FormzStatus.pure));
    } on LogOutFailure catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionCanceled));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionCanceled));
    }
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordObscure));
  }
}
