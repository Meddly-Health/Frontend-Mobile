import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:meddly/connectivity/bloc/connectivity_bloc.dart';
import 'package:meddly/theme/theme.dart';
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
    bool isConnected = context.read<ConnectivityBloc>().state.isConnected;

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return GestureDetector(
          key: const Key('google_login_button'),
          onTap: () {
            if (isConnected) {
              context.read<LoginCubit>().logInWithGoogle();
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
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            bool isConnected =
                context.read<ConnectivityBloc>().state.isConnected;

            if (state.email.value.isNotEmpty &&
                state.password.value.isNotEmpty &&
                isConnected &&
                !state.status.isSubmissionInProgress) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              context.read<LoginCubit>().logInWithCredentials();
            }
          },
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
        bool showErrorText = state.status.isSubmissionFailure;

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
        bool showErrorText = state.status.isSubmissionFailure;
        bool isConnected = context.read<ConnectivityBloc>().state.isConnected;

        return TextFormField(
          key: const Key('login_password'),
          textInputAction: TextInputAction.done,
          onChanged: (String? value) {
            context.read<LoginCubit>().passwordChanged(value!);
          },
          onFieldSubmitted: (String? value) {
            FocusManager.instance.primaryFocus?.unfocus();

            if (state.email.value.isNotEmpty &&
                state.password.value.isNotEmpty &&
                isConnected &&
                !state.status.isSubmissionInProgress) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              context.read<LoginCubit>().logInWithCredentials();
            }
          },
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
