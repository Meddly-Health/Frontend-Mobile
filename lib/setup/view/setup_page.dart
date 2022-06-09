// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';
import 'package:meddly/helpers/assets_provider.dart';
import 'package:user_repository/user_repository.dart';

import 'package:meddly/blocs.dart';
import 'package:meddly/helpers/helpers.dart';
import 'package:meddly/routes/router.dart';
import 'package:meddly/setup/view/widgets/birthdate_field.dart';

import '../../helpers/constants.dart';
import '../../widgets/widgets.dart';
import 'widgets/last_name_field.dart';
import 'widgets/name_field.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  late final PageController pageController;
  late final User? currentUser;

  @override
  void initState() {
    pageController = PageController();
    context.read<UserBloc>().add(GetUser());

    super.initState();
  }

  // TODO: Add haptics everywere.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetupCubit(
          RepositoryProvider.of<UserRepository>(context),
          RepositoryProvider.of<AuthenticationRepository>(context))
        ..pageController = pageController
        ..init(true, context.read<UserBloc>().state.currentUser),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state.status == UserStatus.loading) {
              return const Center(child: Loading());
            }

            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SafeArea(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: defaultPadding,
                    child: Text('Bienvenido a Meddly!',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        // const _SetupView(
                        //   child: _NameAndLastName(),
                        //   lottie: AssetsProvider.medic4,
                        // ),
                        // const _SetupView(
                        //     child: _GenderView(),
                        //     lottie: AssetsProvider.medic2),
                        const _SetupView(
                          child: _BirthDateView(),
                          lottie: AssetsProvider.medic1,
                        ),
                        const _SetupView(
                            child: _AvatarView(),
                            lottie: AssetsProvider.medic5),
                        Stack(
                          children: [
                            const _SetupView(
                                child: _FinishView(),
                                lottie: AssetsProvider.medic3),
                            Positioned(
                                top: 0,
                                child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Lottie.asset(
                                        AssetsProvider.fireworks))),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: SizedBox(
                                    height: 200,
                                    width: 200,
                                    child: Lottie.asset(
                                        AssetsProvider.fireworks))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class _FinishView extends StatelessWidget {
  const _FinishView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '¡Su perfil se ha completado con éxito!',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 35),
        BlocBuilder<SetupCubit, SetupState>(
          builder: (context, state) {
            return Button(
                enabled: true,
                onPressed: () {
                  context.router.pushAndPopUntil(const LoadingRoute(),
                      predicate: (route) => false);
                },
                animate: false,
                enabledColor: Theme.of(context).colorScheme.primary,
                disbaledColor: Theme.of(context).colorScheme.secondaryContainer,
                labelColor: Theme.of(context).colorScheme.secondary,
                label: 'Comenzar ahora!',
                keyString: 'omit');
          },
        )
      ],
    );
  }
}

class _AvatarView extends StatelessWidget {
  const _AvatarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selecciona tu avatar',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Color de piel',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                BlocBuilder<SetupCubit, SetupState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        _AvatarColor(
                            onTap: () {
                              context
                                  .read<SetupCubit>()
                                  .skinColorChanged(lightSkin);
                            },
                            color: lightSkin,
                            isPressed: state.skinColor == lightSkin),
                        const SizedBox(width: 16),
                        _AvatarColor(
                            onTap: () {
                              context
                                  .read<SetupCubit>()
                                  .skinColorChanged(mediumSkin);
                            },
                            color: mediumSkin,
                            isPressed: state.skinColor == mediumSkin),
                        const SizedBox(width: 16),
                        _AvatarColor(
                            onTap: () {
                              context
                                  .read<SetupCubit>()
                                  .skinColorChanged(darkSkin);
                            },
                            color: darkSkin,
                            isPressed: state.skinColor == darkSkin),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  'Color de pelo',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                BlocBuilder<SetupCubit, SetupState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        _AvatarColor(
                            onTap: () {
                              context
                                  .read<SetupCubit>()
                                  .hairColorChanged(brunette);
                            },
                            color: brunette,
                            isPressed: state.hairColor == brunette),
                        const SizedBox(width: 16),
                        _AvatarColor(
                            onTap: () {
                              context
                                  .read<SetupCubit>()
                                  .hairColorChanged(brown);
                            },
                            color: brown,
                            isPressed: state.hairColor == brown),
                        const SizedBox(width: 16),
                        _AvatarColor(
                            onTap: () {
                              context
                                  .read<SetupCubit>()
                                  .hairColorChanged(blonde);
                            },
                            color: blonde,
                            isPressed: state.hairColor == blonde),
                      ],
                    );
                  },
                ),
              ],
            ),
            const Spacer(),
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              radius: 50,
              child: BlocBuilder<SetupCubit, SetupState>(
                builder: (context, state) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: SvgPicture.asset(getAvatarAsset(
                            state.skinColor, state.hairColor, state.sex))),
                  );
                },
              ),
            )
          ],
        ),
        const SizedBox(height: 35),
        BlocBuilder<SetupCubit, SetupState>(
          builder: (context, state) {
            return Button(
                enabled: true,
                onPressed: () {
                  // context.router.pushAndPopUntil(const LoadingRoute(),
                  //     predicate: (route) => false);
                },
                animate: false,
                enabledColor: Theme.of(context).colorScheme.primary,
                disbaledColor: Theme.of(context).colorScheme.secondaryContainer,
                labelColor: Theme.of(context).colorScheme.secondary,
                label: 'Siguiente',
                keyString: 'omit');
          },
        ),
        const SizedBox(height: 16),
        const _OmitButton()
      ],
    );
  }
}

class _AvatarColor extends StatelessWidget {
  const _AvatarColor({
    Key? key,
    required this.color,
    required this.isPressed,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final bool isPressed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
              radius: 28,
              backgroundColor: isPressed ? null : Colors.transparent,
              child: CircleAvatar(radius: 25, backgroundColor: color)),
        );
      },
    );
  }
}

class _BirthDateView extends StatelessWidget {
  const _BirthDateView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '¿Cuál es tu fecha de nacimiento?',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 25),
        const BirthDateField(),
        const SizedBox(height: 16),
        BlocBuilder<SetupCubit, SetupState>(
          builder: (context, state) {
            return Button(
                enabled: state.birthDate.valid,
                onPressed: () {
                  if (state.birthDate.valid) {
                    context.read<SetupCubit>().saveUserData();
                  }
                },
                animate: state.status.isSubmissionInProgress,
                enabledColor: Theme.of(context).colorScheme.primary,
                disbaledColor: Theme.of(context).colorScheme.secondaryContainer,
                labelColor: Theme.of(context).colorScheme.secondary,
                label: 'Siguiente',
                keyString: 'next');
          },
        ),
        const SizedBox(height: 16),
        const _OmitButton()
      ],
    );
  }
}

class _GenderView extends StatelessWidget {
  const _GenderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hola ${context.read<SetupCubit>().state.name.value}, ¿eres hombre o mujer?',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Text.rich(TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(
                            '¿Por qué mostramos sólo estas dos opciones?',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          content: Text(
                            'Por supuesto que, hay más identidades de género que sólo hombres y mujeres. Sin embargo, actualmente Meddly sólo puede diferenciar entre hombre y mujer para realizar los diagnósticos. Meddly aún está aprendiendo sobre el impacto de otras identidades de género en el área de la salud. En este apartado debe completar seleccionando su sexo al nacer.',
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.justify,
                          ),
                          actionsPadding: defaultPadding,
                          actions: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                padding: defaultPadding,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                child: Text('Entendido',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary)),
                              ),
                            ),
                          ],
                        ));
              },
            text: '¿Por qué mostramos sólo estas dos opciones?',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ))),
        const SizedBox(height: 25),
        BlocBuilder<SetupCubit, SetupState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<SetupCubit>().sexChanged(Sex.masculino);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: defaultPadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: state.sex != null && state.sex! == Sex.masculino
                      ? Theme.of(context).colorScheme.secondaryContainer
                      : Theme.of(context).colorScheme.secondary,
                ),
                child: Text('Hombre',
                    style: TextStyle(
                        color: state.sex != null && state.sex! == Sex.masculino
                            ? Theme.of(context).colorScheme.secondary
                            : null)),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        BlocBuilder<SetupCubit, SetupState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<SetupCubit>().sexChanged(Sex.femenino);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: defaultPadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: state.sex != null && state.sex! == Sex.femenino
                      ? Theme.of(context).colorScheme.secondaryContainer
                      : Theme.of(context).colorScheme.secondary,
                ),
                child: Text('Mujer',
                    style: TextStyle(
                        color: state.sex != null && state.sex! == Sex.femenino
                            ? Theme.of(context).colorScheme.secondary
                            : null)),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        BlocBuilder<SetupCubit, SetupState>(
          builder: (context, state) {
            return Button(
                enabled: state.sex != null,
                onPressed: () {
                  if (state.sex != null) {
                    context.read<SetupCubit>().saveUserData();
                  }
                },
                animate: state.status.isSubmissionInProgress,
                enabledColor: Theme.of(context).colorScheme.primary,
                disbaledColor: Theme.of(context).colorScheme.secondaryContainer,
                labelColor: Theme.of(context).colorScheme.secondary,
                label: 'Siguiente',
                keyString: 'next');
          },
        ),
        const SizedBox(height: 16),
        const _OmitButton(),
      ],
    );
  }
}

class _OmitButton extends StatelessWidget {
  const _OmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: defaultPadding,
        alignment: Alignment.center,
        child: Text.rich(TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.read<SetupCubit>().pageController!.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
              },
            text: 'Omitir')));
  }
}

class _NameAndLastName extends StatelessWidget {
  const _NameAndLastName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '¿Cómo te llamas?',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Text('Nombre(s) *',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 16),
        const NameField(),
        const SizedBox(height: 16),
        Text('Apellido(s) *',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 16),
        const LastNameField(),
        const SizedBox(height: 16),
        BlocBuilder<SetupCubit, SetupState>(
          builder: (context, state) {
            return Button(
                enabled: state.name.valid && state.lastName.valid,
                onPressed: () {
                  if (state.name.valid && state.lastName.valid) {
                    context.read<SetupCubit>().saveUserData();
                  }
                },
                animate: state.status.isSubmissionInProgress,
                enabledColor: Theme.of(context).colorScheme.primary,
                disbaledColor: Theme.of(context).colorScheme.secondaryContainer,
                labelColor: Theme.of(context).colorScheme.secondary,
                label: 'Siguiente',
                keyString: 'next');
          },
        ),
      ],
    );
  }
}

class _SetupView extends StatelessWidget {
  const _SetupView({
    Key? key,
    required this.child,
    this.lottie,
  }) : super(key: key);

  final Widget child;
  final String? lottie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.height / 3.5,
              child: lottie == null ? null : Lottie.asset(lottie!),
            ),
            const SizedBox(height: 16),
            child
          ],
        ),
      ),
    );
  }
}

// TODO: Remove

class _InformationText extends StatelessWidget {
  const _InformationText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: 'La información de esta página ',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .color!
                  .withOpacity(0.5))),
      TextSpan(
          text: 'se utiliza ',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .color!
                  .withOpacity(0.5),
              fontWeight: FontWeight.bold)),
      TextSpan(
          text: 'para tus evaluaciones. ',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .color!
                  .withOpacity(0.5))),
      TextSpan(
          recognizer: TapGestureRecognizer()..onTap = () {},
          text: 'Mas información ',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: const Color(0xff53ACFF))),
    ]));
  }
}
