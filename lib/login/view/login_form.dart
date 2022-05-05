import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:meddly/helpers/assets_provider.dart';

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
          onTap: () {
            context.read<LoginCubit>().logInWithGoogle();
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
                    SvgPicture.asset(AssetsProvider.google_icon),
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
            if (state.status.isValid) {
              context.read<LoginCubit>().logInWithCredentials();
            }
          },
          child: AnimatedContainer(
              height: 55,
              decoration: BoxDecoration(
                color: state.status.isValid
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              duration: const Duration(milliseconds: 200),
              child: Center(
                child: Text('Iniciar Sesión',
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
            state.status.isSubmissionFailure && state.email.invalid;

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
              errorText: !showErrorText ? null : 'El email es incorrecto.',
              errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
              labelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
              // suffixIcon: _showCheckIcon(),
              // suffixIconConstraints: const BoxConstraints(
              //     maxHeight: 30, maxWidth: 30, minHeight: 30, minWidth: 30),
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
            state.status.isSubmissionFailure && state.password.invalid;

        return TextFormField(
            key: const Key('login_password'),
            textInputAction: TextInputAction.done,
            onChanged: (String? value) {
              context.read<LoginCubit>().passwordChanged(value!);
            },
            onFieldSubmitted: (String? value) {
              FocusManager.instance.primaryFocus?.unfocus();
              if (state.status.isValid) {
                context.read<LoginCubit>().logInWithCredentials();
              }
            },
            keyboardType: TextInputType.emailAddress,
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
              errorText: !showErrorText ? null : 'La contraseña es incorrecta.',
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
              // suffixIcon: _showCheckIcon(),
              // suffixIconConstraints: const BoxConstraints(
              //     maxHeight: 30, maxWidth: 30, minHeight: 30, minWidth: 30),
            ));
      },
    );
  }
}

// Widget? _showCheckIcon() {
//     if (isValid && errorText == null) {
//       return Padding(
//         padding: const EdgeInsets.only(right: 10),
//         child: ZoomIn(
//             duration: const Duration(milliseconds: 200),
//             child: SvgPicture.asset(
//               'assets/circle-check.svg',
//               color: theme.circleCheckColor,
//               package: 'bloc_form_field',
//             )),
//       );
//     }
//     if (errorText != null) {
//       return Padding(
//         padding: const EdgeInsets.only(right: 10),
//         child: ZoomIn(
//             duration: const Duration(milliseconds: 200),
//             child: SvgPicture.asset(
//               'assets/error.svg',
//               color: theme.errorColor,
//               package: 'bloc_form_field',
//             )),
//       );
//     }
//     return null;
//   }