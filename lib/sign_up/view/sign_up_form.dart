import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import '../../connectivity/bloc/connectivity_bloc.dart';
import '../../helpers/assets_provider.dart';

import '../../helpers/constants.dart';
import '../../helpers/helpers.dart';
import '../../widgets/widgets.dart';
import '../cubit/sign_up_cubit.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
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
        children: const [
          _NameField(),
          SizedBox(height: 16),
          _LastNameField(),
          SizedBox(height: 16),
          _BirthDateField(),
          SizedBox(height: 16),
          Divider(),
          _EmailField(),
          SizedBox(height: 16),
          _PasswordField(),
          SizedBox(height: 16),
          _ConfirmedPasswordField(),
          SizedBox(height: 16),
          _TermsAndConditions(),
          SizedBox(height: 20),
          _SignUpButton(),
          SizedBox(height: 16),
          Divider(),
          SizedBox(height: 16),
          _GoogleSignupButton()
        ],
      ),
    );
  }
}

class _BirthDateField extends StatefulWidget {
  const _BirthDateField({Key? key}) : super(key: key);

  @override
  State<_BirthDateField> createState() => _BirthDateFieldState();
}

class _BirthDateFieldState extends State<_BirthDateField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        var birthDate = state.birthDate;

        bool showErrorText = birthDate.value != null && birthDate.invalid;

        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                AssetsProvider.calendarIcon,
                height: 20,
                width: 20,
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  var _dateTime = await DatePicker.showSimpleDatePicker(context,
                      titleText: 'Seleccione una fecha',
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      dateFormat: 'dd-MMMM-yyyy',
                      locale: DateTimePickerLocale.es,
                      confirmText: 'Aceptar',
                      cancelText: 'Cancelar',
                      itemTextStyle: Theme.of(context).textTheme.bodyMedium);

                  if (_dateTime != null) {
                    BlocProvider.of<SignUpCubit>(context)
                        .birthDateChanged(_dateTime);
                    _controller.text = formatDate(_dateTime);
                  }
                },
                child: TextFormField(
                    key: const Key('sign_up_birthDate'),
                    textInputAction: TextInputAction.next,
                    controller: _controller,
                    enabled: false,
                    keyboardType: TextInputType.emailAddress,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .secondaryContainer
                              .withOpacity(0.4),
                        ),
                      ),
                      hintText: 'Fecha de nacimiento',
                      errorText:
                          showErrorText ? 'Debe ser mayor de 18 años.' : null,
                      suffixIcon: showCheckIcon(birthDate.valid, context),
                      suffixIconConstraints: const BoxConstraints(
                          maxHeight: 30,
                          maxWidth: 30,
                          minHeight: 30,
                          minWidth: 30),
                    )),
              ),
            )
          ],
        );
      },
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        var name = state.name;
        bool showErrorText = name.value.isNotEmpty && name.invalid;

        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                AssetsProvider.profileIcon,
                height: 20,
                width: 20,
              ),
            ),
            Expanded(
              child: TextFormField(
                  key: const Key('sign_up_name'),
                  textInputAction: TextInputAction.next,
                  onChanged: (String? value) {
                    context.read<SignUpCubit>().nameChanged(value!);
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: 'Nombre',
                    errorText: showErrorText
                        ? 'El nombre ingresado es inválido.'
                        : null,
                    suffixIcon: showCheckIcon(name.valid, context),
                    suffixIconConstraints: const BoxConstraints(
                        maxHeight: 30,
                        maxWidth: 30,
                        minHeight: 30,
                        minWidth: 30),
                  )),
            )
          ],
        );
      },
    );
  }
}

class _LastNameField extends StatelessWidget {
  const _LastNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        var lastName = state.lastName;
        bool showErrorText = lastName.value.isNotEmpty && lastName.invalid;
        return Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: SizedBox(
                height: 20,
                width: 20,
              ),
            ),
            Expanded(
              child: TextFormField(
                  key: const Key('sign_up_lastName'),
                  textInputAction: TextInputAction.next,
                  onChanged: (String? value) {
                    context.read<SignUpCubit>().lastNameChanged(value!);
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: 'Apellido',
                    errorText: showErrorText
                        ? 'El apellido ingresado es inválido.'
                        : null,
                    suffixIcon: showCheckIcon(lastName.valid, context),
                    suffixIconConstraints: const BoxConstraints(
                        maxHeight: 30,
                        maxWidth: 30,
                        minHeight: 30,
                        minWidth: 30),
                  )),
            )
          ],
        );
      },
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
      Expanded(
        child: AutoSizeText.rich(TextSpan(children: [
          TextSpan(
              text: 'Acepto los ',
              style: Theme.of(context).textTheme.bodyMedium),
          TextSpan(
              text: 'términos y condiciones',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold)),
        ])),
      )
    ]);
  }
}

class _GoogleSignupButton extends StatelessWidget {
  const _GoogleSignupButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        double width = MediaQuery.of(context).size.width;
        bool isLoading =
            state.status.isSubmissionInProgress && state.isGoogleSignIn;
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
                  ? const LoadingButton()
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

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        var width = MediaQuery.of(context).size.width;
        bool isLoading =
            !state.isGoogleSignIn && state.status.isSubmissionInProgress;
        bool isEnabled = state.status.isValidated && state.termsAccepted;
        bool isDone = !state.isGoogleSignIn && state.status.isSubmissionSuccess;

        return GestureDetector(
          key: const Key('sign_up_button'),
          onTap: () {
            HapticFeedback.lightImpact();
            _signInWithEmailAndPassword(context, state);
          },
          child: AnimatedContainer(
            height: 64,
            decoration: BoxDecoration(
              color: isEnabled
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: isLoading || isDone
                  ? BorderRadius.circular(99)
                  : BorderRadius.circular(20),
            ),
            onEnd: () {},
            width: isLoading || isDone ? 64 : width,
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeIn,
            child: isLoading
                ? const LoadingButton()
                : Center(
                    child: FittedBox(
                      child: isDone
                          ? ElasticIn(
                              child: SvgPicture.asset(
                                AssetsProvider.success,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            )
                          : Text('Registrarse ahora',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                    ),
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
                  key: const Key('sign_up_email'),
                  textInputAction: TextInputAction.next,
                  onChanged: (String? value) {
                    context.read<SignUpCubit>().emailChanged(value!);
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: 'Correo electrónico',
                    errorText: !showErrorText ? null : 'El email es inválido.',
                    suffixIcon: showCheckIcon(state.email.valid, context),
                    suffixIconConstraints: const BoxConstraints(
                        maxHeight: 30,
                        maxWidth: 30,
                        minHeight: 30,
                        minWidth: 30),
                  )),
            ),
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
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        bool showErrorText = state.password.value.isNotEmpty &&
            state.password.invalid &&
            !state.isGoogleSignIn;

        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(AssetsProvider.lockIconOutline,
                  height: 20, width: 20),
            ),
            Expanded(
              child: TextFormField(
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
                    errorText: !showErrorText
                        ? null
                        : 'La contraseña debe poseer al menos 8 caracteres e incluir al menos un número y al menos un carácter especial.',
                    errorMaxLines: 5,
                    labelStyle: state.errorMessage == null
                        ? Theme.of(context).textTheme.bodyMedium
                        : Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: state.errorMessage == null
                        ? Theme.of(context).textTheme.bodyMedium
                        : Theme.of(context).textTheme.bodyMedium,
                    suffixIcon: Row(
                      children: [
                        GestureDetector(
                          onTap: () => context
                              .read<SignUpCubit>()
                              .togglePasswordVisibility(),
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: SvgPicture.asset(
                              state.isPasswordObscure
                                  ? AssetsProvider.eyeCrossed
                                  : AssetsProvider.eye,
                              height: 20,
                              width: 20,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                            ),
                          ),
                        ),
                        if (state.password.valid)
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: showCheckIcon(state.password.valid, context),
                          ),
                      ],
                    ),
                    suffixIconConstraints: BoxConstraints(
                      maxHeight: 30,
                      maxWidth: state.password.valid ? 60 : 30,
                    ),
                  )),
            ),
          ],
        );
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

        return Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: SizedBox(height: 20, width: 20),
            ),
            Expanded(
              child: TextFormField(
                  key: const Key('sign_up_confirmed_password'),
                  textInputAction: TextInputAction.next,
                  onChanged: (String? value) {
                    context
                        .read<SignUpCubit>()
                        .confirmedPasswordChanged(value!);
                  },
                  keyboardType: TextInputType.text,
                  style: Theme.of(context).textTheme.bodyMedium,
                  obscureText: state.isPasswordObscure,
                  decoration: InputDecoration(
                    hintText: 'Confirmar contraseña',
                    errorText:
                        !showErrorText ? null : 'Las contraseñas no coinciden.',
                    errorStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                            color: Theme.of(context).colorScheme.error,
                            overflow: TextOverflow.visible),
                    errorMaxLines: 1,
                    suffixIcon: Row(children: [
                      GestureDetector(
                        onTap: () => context
                            .read<SignUpCubit>()
                            .togglePasswordVisibility(),
                        child: Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            state.isPasswordObscure
                                ? AssetsProvider.eyeCrossed
                                : AssetsProvider.eye,
                            height: 20,
                            width: 20,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                          ),
                        ),
                      ),
                      if (state.confirmedPassword.valid)
                        SizedBox(
                            height: 30,
                            width: 30,
                            child: showCheckIcon(
                                state.confirmedPassword.valid, context))
                    ]),
                    suffixIconConstraints: BoxConstraints(
                      maxHeight: 30,
                      maxWidth: state.confirmedPassword.valid ? 60 : 30,
                    ),
                  )),
            ),
          ],
        );
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
