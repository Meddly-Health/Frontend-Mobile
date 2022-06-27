import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:form_helper/form_helper.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:meddly/helpers/extensions.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository, this._userRepository)
      : super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  void termsAcceptedChanged(bool value) =>
      emit(state.copyWith(termsAccepted: value));

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordObscure: !state.isPasswordObscure));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        state.name,
        state.lastName,
        state.birthDate,
        email,
        state.password,
        state.confirmedPassword,
      ]),
    ));
  }

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(
      state.copyWith(
        name: name,
        status: Formz.validate([
          name,
          state.lastName,
          state.email,
          state.birthDate,
          state.password,
          state.confirmedPassword,
        ]),
      ),
    );
  }

  void lastNameChanged(String value) {
    final lastName = LastName.dirty(value);
    emit(
      state.copyWith(
        lastName: lastName,
        status: Formz.validate([
          state.name,
          lastName,
          state.birthDate,
          state.email,
          state.password,
          state.confirmedPassword,
        ]),
      ),
    );
  }

  void birthDateChanged(DateTime value) {
    final birthDate = BirthDate.dirty(value);
    emit(state.copyWith(
      birthDate: birthDate,
      status: Formz.validate([
        state.name,
        state.lastName,
        birthDate,
        state.email,
        state.password,
        state.confirmedPassword,
      ]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );
    emit(state.copyWith(
      password: password,
      confirmedPassword: confirmedPassword,
      status: Formz.validate([
        state.name,
        state.lastName,
        state.birthDate,
        state.email,
        password,
        confirmedPassword,
      ]),
    ));
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(state.copyWith(
      confirmedPassword: confirmedPassword,
      status: Formz.validate([
        state.email,
        state.password,
        confirmedPassword,
      ]),
    ));
  }

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(
        status: FormzStatus.submissionInProgress, isGoogleSignIn: true));
    try {
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

  Future<void> signUpFormSubmitted() async {
    if (!state.status.isValidated && !state.termsAccepted) return;
    emit(state.copyWith(
        status: FormzStatus.submissionInProgress, isGoogleSignIn: false));

    try {
      await _authenticationRepository.signUp(
        email: state.email.value.trim().toLowerCase(),
        password: state.password.value.trim(),
      );

      User user = User(
        firstName: state.name.value.capitalize(),
        lastName: state.lastName.value.capitalize(),
        birth: state.birthDate.value,
      );

      var response = await _userRepository.updateUser(user);

      response.fold(
        (l) => emit(state.copyWith(
          errorMessage: l.message,
          status: FormzStatus.submissionFailure,
        )),
        (r) => emit(state.copyWith(status: FormzStatus.submissionSuccess)),
      );
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(state.copyWith(
        errorMessage: SignUpWithEmailAndPasswordFailure(e.message).message,
        status: FormzStatus.submissionFailure,
      ));
    } on UserException catch (e) {
      emit(state.copyWith(
        errorMessage: e.message,
        status: FormzStatus.submissionFailure,
      ));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
