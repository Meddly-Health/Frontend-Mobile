part of 'sign_up_cubit.dart';

enum ConfirmPasswordValidationError { invalid }

class SignUpState extends Equatable {
  const SignUpState(
      {this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.confirmedPassword = const ConfirmedPassword.pure(),
      this.status = FormzStatus.pure,
      this.termsAccepted = false,
      this.errorMessage,
      this.isGoogleSignIn = false,
      this.isPasswordObscure = true});

  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzStatus status;
  final bool termsAccepted;
  final String? errorMessage;
  final bool isGoogleSignIn;
  final bool isPasswordObscure;

  @override
  List<Object> get props => [
        email,
        password,
        confirmedPassword,
        status,
        termsAccepted,
        isGoogleSignIn,
        isPasswordObscure
      ];

  SignUpState copyWith(
      {Email? email,
      Password? password,
      ConfirmedPassword? confirmedPassword,
      FormzStatus? status,
      String? errorMessage,
      bool? termsAccepted,
      bool? isGoogleSignIn,
      bool? isPasswordObscure}) {
    return SignUpState(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmedPassword: confirmedPassword ?? this.confirmedPassword,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        termsAccepted: termsAccepted ?? this.termsAccepted,
        isGoogleSignIn: isGoogleSignIn ?? this.isGoogleSignIn,
        isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure);
  }
}
