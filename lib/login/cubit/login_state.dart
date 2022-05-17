part of 'login_cubit.dart';

@immutable
class LoginState extends Equatable {
  const LoginState(
      {this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.status = FormzStatus.pure,
      this.errorMessage,
      this.isPasswordObscure = true});

  final Email email;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;
  final bool isPasswordObscure;

  @override
  List<Object?> get props =>
      [email, password, status, errorMessage, isPasswordObscure];

  LoginState copyWith(
      {Email? email,
      Password? password,
      FormzStatus? status,
      String? errorMessage,
      bool? isPasswordVisible}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        isPasswordObscure: isPasswordVisible ?? isPasswordObscure);
  }
}
