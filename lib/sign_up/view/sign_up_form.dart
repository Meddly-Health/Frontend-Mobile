import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import '../../connectivity/bloc/connectivity_bloc.dart';
import '../../helpers/assets_provider.dart';

import '../../helpers/helpers.dart';
import '../../widgets/widgets.dart';
import '../cubit/sign_up_cubit.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        _EmailField(),
        SizedBox(height: 16),
        _PasswordField(),
        SizedBox(height: 16),
        _ConfirmedPasswordField(),
        SizedBox(height: 20),
        _TermsAndConditions(),
        SizedBox(height: 20),
        _SignUpButton(),
        SizedBox(height: 16),
        _GoogleLogginButton()
      ],
    );
  }
}

class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          return Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              activeColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              value: state.termsAccepted,
              onChanged: (bool? value) {
                HapticFeedback.lightImpact();
                context.read<SignUpCubit>().termsAcceptedChanged(value!);
              });
        },
      ),
      Text.rich(TextSpan(children: [
        TextSpan(
            text: 'Acepto los ', style: Theme.of(context).textTheme.bodyMedium),
        TextSpan(
            text: 'términos y condiciones',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold)),
      ]))
    ]);
  }
}

class _GoogleLogginButton extends StatelessWidget {
  const _GoogleLogginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return GestureDetector(
          key: const Key('google_login_button'),
          onTap: () {
            HapticFeedback.lightImpact();
            _loginWithGoogle(context, state);
          },
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: state.status.isSubmissionInProgress && state.isGoogleSignIn
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        strokeWidth: 2,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(AssetsProvider.googleIcon),
                        const SizedBox(width: 16),
                        Text('Iniciar Sesión con Google',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return GestureDetector(
          key: const Key('sign_up_button'),
          onTap: () {
            HapticFeedback.lightImpact();
            _signInWithEmailAndPassword(context, state);
          },
          child: AnimatedContainer(
            height: 55,
            decoration: BoxDecoration(
              color: state.status.isValid && state.termsAccepted ||
                      state.status.isSubmissionInProgress
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            duration: const Duration(milliseconds: 200),
            child: Center(
              child:
                  state.status.isSubmissionInProgress && !state.isGoogleSignIn
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: Loading(),
                        )
                      : Text('Regístrate',
                          style: Theme.of(context).textTheme.labelMedium),
            ),
          ),
        );
      },
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        bool showErrorText = state.email.value.isNotEmpty &&
            state.email.invalid &&
            !state.isGoogleSignIn;

        return TextFormField(
            key: const Key('sign_up_email'),
            textInputAction: TextInputAction.next,
            onChanged: (String? value) {
              context.read<SignUpCubit>().emailChanged(value!);
            },
            keyboardType: TextInputType.emailAddress,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: 'Correo electrónico',
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
              ),
              errorText: !showErrorText ? null : 'El email es inválido.',
              errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
              labelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
              suffixIcon: showCheckIcon(state.email.valid, context),
              suffixIconConstraints: const BoxConstraints(
                  maxHeight: 30, maxWidth: 30, minHeight: 30, minWidth: 30),
            ));
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        bool showErrorText = state.password.value.isNotEmpty &&
            state.password.invalid &&
            !state.isGoogleSignIn;

        return TextFormField(
            key: const Key('sign_up_password'),
            textInputAction: TextInputAction.next,
            onChanged: (String? value) {
              context.read<SignUpCubit>().passwordChanged(value!);
            },
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.bodyMedium,
            obscureText: state.isPasswordObscure,
            decoration: InputDecoration(
              hintText: 'Contraseña',
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
              ),
              errorText: !showErrorText
                  ? null
                  : 'La contraseña debe poseer al menos 8 caracteres e incluir al menos un número y al menos un carácter especial.',
              errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  overflow: TextOverflow.visible),
              errorMaxLines: 3,
              labelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
              suffixIcon: Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: showCheckIcon(state.password.valid, context),
                  ),
                  GestureDetector(
                    onTap: () =>
                        context.read<SignUpCubit>().togglePasswordVisibility(),
                    child: Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        state.isPasswordObscure
                            ? AssetsProvider.eyeCrossed
                            : AssetsProvider.eye,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
              suffixIconConstraints: const BoxConstraints(
                  maxHeight: 30, maxWidth: 70, minHeight: 30, minWidth: 70),
            ));
      },
    );
  }
}

class _ConfirmedPasswordField extends StatelessWidget {
  const _ConfirmedPasswordField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        bool showErrorText = state.confirmedPassword.value.isNotEmpty &&
            state.confirmedPassword.invalid &&
            !state.isGoogleSignIn;

        return TextFormField(
            key: const Key('sign_up_confirmed_password'),
            textInputAction: TextInputAction.next,
            onChanged: (String? value) {
              context.read<SignUpCubit>().confirmedPasswordChanged(value!);
            },
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.bodyMedium,
            obscureText: state.isPasswordObscure,
            decoration: InputDecoration(
              hintText: 'Confirmar contraseña',
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
              ),
              errorText:
                  !showErrorText ? null : 'Las contraseñas no coinciden.',
              errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  overflow: TextOverflow.visible),
              errorMaxLines: 1,
              labelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
              suffixIcon: Row(children: [
                SizedBox(
                    height: 30,
                    width: 30,
                    child:
                        showCheckIcon(state.confirmedPassword.valid, context)),
                GestureDetector(
                  onTap: () =>
                      context.read<SignUpCubit>().togglePasswordVisibility(),
                  child: Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(
                      state.isPasswordObscure
                          ? AssetsProvider.eyeCrossed
                          : AssetsProvider.eye,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                )
              ]),
              suffixIconConstraints: const BoxConstraints(
                  maxHeight: 30, maxWidth: 70, minHeight: 30, minWidth: 70),
            ));
      },
    );
  }
}

void _loginWithGoogle(BuildContext context, SignUpState state) {
  bool isConnected = context.read<ConnectivityBloc>().state.isConnected;

  if (!isConnected) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
        getSnackBar(context, 'No hay conexión a internet', SnackBarType.error));
    return;
  }

  context.read<SignUpCubit>().logInWithGoogle();
}

void _signInWithEmailAndPassword(BuildContext context, SignUpState state) {
  bool isConnected = context.read<ConnectivityBloc>().state.isConnected;

  if (!isConnected) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
        getSnackBar(context, 'No hay conexión a internet', SnackBarType.error));
    return;
  }

  if (state.status.isValid && state.termsAccepted) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    context.read<SignUpCubit>().signUpFormSubmitted();
  }
}
