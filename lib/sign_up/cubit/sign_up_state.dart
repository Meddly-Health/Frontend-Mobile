part of 'sign_up_cubit.dart';

enum ConfirmPasswordValidationError { invalid }

class SignUpState extends Equatable {
  const SignUpState(
      {this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.name = const Name.pure(),
      this.lastName = const LastName.pure(),
      this.birthDate = const BirthDate.pure(),
      this.confirmedPassword = const ConfirmedPassword.pure(),
      this.status = FormzStatus.pure,
      this.termsAccepted = false,
      this.errorMessage,
      this.isGoogleSignIn = false,
      this.isPasswordObscure = true});

  final Email email;
  final Password password;
  final Name name;
  final LastName lastName;
  final BirthDate birthDate;
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
        name,
        lastName,
        birthDate,
        status,
        termsAccepted,
        isGoogleSignIn,
        isPasswordObscure
      ];

  SignUpState copyWith({
    Email? email,
    Password? password,
    Name? name,
    LastName? lastName,
    BirthDate? birthDate,
    ConfirmedPassword? confirmedPassword,
    FormzStatus? status,
    bool? termsAccepted,
    String? errorMessage,
    bool? isGoogleSignIn,
    bool? isPasswordObscure,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
      termsAccepted: termsAccepted ?? this.termsAccepted,
      errorMessage: errorMessage ?? this.errorMessage,
      isGoogleSignIn: isGoogleSignIn ?? this.isGoogleSignIn,
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
    );
  }
}
