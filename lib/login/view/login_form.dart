import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:meddly/connectivity/bloc/connectivity_bloc.dart';
import 'package:meddly/widgets/snackbar.dart';
import '../../helpers/assets_provider.dart';

import '../cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
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
        SizedBox(height: 20),
        _LogginButton(),
        SizedBox(height: 16),
        _GoogleLogginButton()
      ],
    );
  }
}

class _GoogleLogginButton extends StatelessWidget {
  const _GoogleLogginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return GestureDetector(
          key: const Key('google_login_button'),
          onTap: () => _loginWithGoogle(context, state),
          child: AnimatedContainer(
            height: 55,
            duration: const Duration(milliseconds: 200),
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

class _LogginButton extends StatelessWidget {
  const _LogginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return GestureDetector(
          key: const Key('login_button'),
          onTap: () => _loginWithCredentials(context, state),
          child: AnimatedContainer(
              height: 55,
              decoration: BoxDecoration(
                color: state.email.value.isNotEmpty &&
                        state.password.value.isNotEmpty
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              duration: const Duration(milliseconds: 200),
              child: Center(
                child:
                    state.status.isSubmissionInProgress && !state.isGoogleSignIn
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              strokeWidth: 2,
                            ),
                          )
                        : Text('Iniciar Sesión',
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
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        bool showErrorText =
            state.status.isSubmissionFailure && !state.isGoogleSignIn;

        return TextFormField(
            key: const Key('login_email'),
            textInputAction: TextInputAction.next,
            onChanged: (String? value) {
              context.read<LoginCubit>().emailChanged(value!);
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
              errorText: !showErrorText ? null : '',
              errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
              labelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
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
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        bool showErrorText =
            state.status.isSubmissionFailure && !state.isGoogleSignIn;

        return TextFormField(
          key: const Key('login_password'),
          textInputAction: TextInputAction.done,
          onChanged: (String? value) {
            context.read<LoginCubit>().passwordChanged(value!);
          },
          onFieldSubmitted: (String? value) =>
              _loginWithCredentials(context, state),
          keyboardType: TextInputType.text,
          style: Theme.of(context).textTheme.bodyMedium,
          obscureText: state.isPasswordObscure,
          decoration: InputDecoration(
            hintText: 'Contraseña',
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
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
            errorText: !showErrorText ? null : '',
            errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.error,
                overflow: TextOverflow.visible),
            errorMaxLines: 2,
            labelStyle: state.errorMessage == null
                ? Theme.of(context).textTheme.bodyMedium
                : Theme.of(context).textTheme.bodyMedium,
            floatingLabelStyle: state.errorMessage == null
                ? Theme.of(context).textTheme.bodyMedium
                : Theme.of(context).textTheme.bodyMedium,
            suffixIcon: GestureDetector(
              onTap: () =>
                  context.read<LoginCubit>().togglePasswordVisibility(),
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
            suffixIconConstraints: const BoxConstraints(
                maxHeight: 30, maxWidth: 30, minHeight: 30, minWidth: 30),
          ),
        );
      },
    );
  }
}

void _loginWithCredentials(BuildContext context, LoginState state) {
  FocusManager.instance.primaryFocus?.unfocus();
  bool isConnected = context.read<ConnectivityBloc>().state.isConnected;

  if (!isConnected) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
        getSnackBar(context, 'No hay conexión a internet', SnackBarType.error));
    return;
  }

  if (state.email.value.isNotEmpty &&
      state.password.value.isNotEmpty &&
      !state.status.isSubmissionInProgress) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    context.read<LoginCubit>().logInWithCredentials();
  }
}

void _loginWithGoogle(BuildContext context, LoginState state) {
  bool isConnected = context.read<ConnectivityBloc>().state.isConnected;

  if (!isConnected) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
        getSnackBar(context, 'No hay conexión a internet', SnackBarType.error));
    return;
  }

  context.read<LoginCubit>().logInWithGoogle();
}
