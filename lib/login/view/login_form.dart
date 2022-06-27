import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

import 'package:meddly/connectivity/bloc/connectivity_bloc.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/widgets/snackbar.dart';

import '../../helpers/assets_provider.dart';
import '../cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPadding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.secondary),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _EmailField(),
          const SizedBox(height: 16),
          const _PasswordField(),
          const SizedBox(height: 32),
          Align(
              alignment: Alignment.centerRight,
              child: Text('¿Olvidaste la contraseña?',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500))),
          const SizedBox(height: 32),
          const _LoginButton(),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          const _GoogleLogginButton()
        ],
      ),
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
        bool isLoading =
            state.status.isSubmissionInProgress && state.isGoogleSignIn;
        var width = MediaQuery.of(context).size.width;

        return GestureDetector(
          key: const Key('google_login_button'),
          onTap: () {
            HapticFeedback.lightImpact();
            _loginWithGoogle(context, state);
          },
          child: AnimatedContainer(
            height: 64,
            width: isLoading ? 64 : width,
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: isLoading
                  ? const _LoadingButton()
                  : FittedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(AssetsProvider.googleIcon,
                              height: 25),
                          const SizedBox(width: 16),
                          Text('Iniciar sesión con Google',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}

class _LoadingButton extends StatelessWidget {
  const _LoadingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDoubleBounce(
        size: 30,
        duration: const Duration(milliseconds: 1000),
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var email = state.email;
        var password = state.password;
        var width = MediaQuery.of(context).size.width;
        bool isLoading =
            !state.isGoogleSignIn && state.status.isSubmissionInProgress;
        bool isEnabled = email.value.isNotEmpty && password.value.isNotEmpty;

        return GestureDetector(
            key: const Key('login_button'),
            onTap: () {
              HapticFeedback.lightImpact();
              _loginWithCredentials(context, state);
            },
            child: AnimatedContainer(
              height: 64,
              decoration: BoxDecoration(
                color: isEnabled
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: isLoading
                    ? BorderRadius.circular(99)
                    : BorderRadius.circular(20),
              ),
              onEnd: () {},
              width: isLoading ? 64 : width,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeIn,
              child: isLoading
                  ? const _LoadingButton()
                  : Center(
                      child: FittedBox(
                        child: Text('Iniciar sesión',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                      ),
                    ),
            ));
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

        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                AssetsProvider.at,
                height: 20,
                width: 20,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
            Expanded(
              child: TextFormField(
                  key: const Key('login_email'),
                  textInputAction: TextInputAction.next,
                  onChanged: (String? value) {
                    context.read<LoginCubit>().emailChanged(value!);
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: 'Correo electrónico',
                    errorStyle: const TextStyle(height: 0),
                    errorText: !showErrorText ? null : '',
                  )),
            )
          ],
        );
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

        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                AssetsProvider.lockIconOutline,
                height: 20,
                width: 20,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
            Expanded(
              child: TextFormField(
                key: const Key('login_password'),
                textInputAction: TextInputAction.done,
                onChanged: (String? value) {
                  context.read<LoginCubit>().passwordChanged(value!);
                },
                onFieldSubmitted: (String? value) {
                  HapticFeedback.lightImpact();
                  _loginWithCredentials(context, state);
                },
                keyboardType: TextInputType.text,
                style: Theme.of(context).textTheme.bodyMedium,
                obscureText: state.isPasswordObscure,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  errorStyle: const TextStyle(height: 0),
                  errorText: !showErrorText ? null : '',
                  errorMaxLines: 2,
                  suffixIcon: GestureDetector(
                    onTap: () =>
                        context.read<LoginCubit>().togglePasswordVisibility(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        state.isPasswordObscure
                            ? AssetsProvider.eyeCrossed
                            : AssetsProvider.eye,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    maxHeight: 40,
                    maxWidth: 40,
                  ),
                ),
              ),
            ),
          ],
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
