import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:meddly/theme/theme.dart';
import '../../connectivity/bloc/connectivity_bloc.dart';
import '../../helpers/assets_provider.dart';

import '../../helpers/helpers.dart';
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
              activeColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              value: state.termsAccepted,
              onChanged: (bool? value) {
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
    bool isConnected = context.read<ConnectivityBloc>().state.isConnected;

    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return GestureDetector(
          key: const Key('google_login_button'),
          onTap: () {
            if (isConnected) {
              context.read<SignUpCubit>().logInWithGoogle();
            }
          },
          child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(AssetsProvider.googleIcon),
                    const SizedBox(width: 16),
                    Text('Iniciar Sesión con Google',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              )),
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
    bool isConnected = context.read<ConnectivityBloc>().state.isConnected;

    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return GestureDetector(
          key: const Key('sign_up_button'),
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if (state.status.isValid &&
                state.termsAccepted &&
                isConnected &&
                !state.status.isSubmissionInProgress) {
              context.read<SignUpCubit>().signUpFormSubmitted();
            }
          },
          child: AnimatedContainer(
              height: 55,
              decoration: BoxDecoration(
                color: state.status.isValid && state.termsAccepted
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              duration: const Duration(milliseconds: 200),
              child: Center(
                child: state.status.isSubmissionInProgress
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .validColor
                              .withOpacity(0.2),
                          strokeWidth: 2,
                        ),
                      )
                    : Text('Registrarse',
                        style: Theme.of(context).textTheme.labelMedium),
              )),
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
        bool showErrorText =
            state.email.value.isNotEmpty && state.email.invalid;

        return TextFormField(
            key: const Key('sign_up_email'),
            textInputAction: TextInputAction.next,
            onChanged: (String? value) {
              context.read<SignUpCubit>().emailChanged(value!);
            },
            keyboardType: TextInputType.emailAddress,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: 'Correo Electrónico',
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
        bool showErrorText =
            state.password.value.isNotEmpty && state.password.invalid;

        return TextFormField(
            key: const Key('sign_up_password'),
            textInputAction: TextInputAction.next,
            onChanged: (String? value) {
              context.read<SignUpCubit>().passwordChanged(value!);
            },
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.bodyMedium,
            obscureText: true,
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
              suffixIcon: showCheckIcon(state.password.valid, context),
              suffixIconConstraints: const BoxConstraints(
                  maxHeight: 30, maxWidth: 30, minHeight: 30, minWidth: 30),
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
            state.confirmedPassword.invalid;

        bool isConnected = context.read<ConnectivityBloc>().state.isConnected;

        return TextFormField(
            key: const Key('sign_up_confirmed_password'),
            textInputAction: TextInputAction.done,
            onChanged: (String? value) {
              context.read<SignUpCubit>().confirmedPasswordChanged(value!);
            },
            onFieldSubmitted: (String? value) {
              FocusManager.instance.primaryFocus?.unfocus();
              if (state.status.isValid &&
                  state.termsAccepted &&
                  isConnected &&
                  !state.status.isSubmissionInProgress) {
                context.read<SignUpCubit>().signUpFormSubmitted();
              }
            },
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.bodyMedium,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Confirmar Contraseña',
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
              suffixIcon: showCheckIcon(state.confirmedPassword.valid, context),
              suffixIconConstraints: const BoxConstraints(
                  maxHeight: 30, maxWidth: 30, minHeight: 30, minWidth: 30),
            ));
      },
    );
  }
}
