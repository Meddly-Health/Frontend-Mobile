// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:meddly/blocs.dart';
import 'package:meddly/routes/router.dart';
import 'package:meddly/setup/view/widgets/birthdate_field.dart';
import 'package:user_repository/user_repository.dart';

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

  @override
  void initState() {
    pageController = PageController();
    context.read<SetupCubit>().pageController = pageController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
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
                children: const [
                  _SetupView(child: _NameAndLastName()),
                  _SetupView(child: _GenderView()),
                  _SetupView(child: _BirthDateView()),
                  _SetupView(child: _FinishView())
                ],
              ),
            ),
          ],
        )),
      ),
    );
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
        Text('¿Por qué mostramos sólo estas dos opciones?',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                )),
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
                      ? Theme.of(context).colorScheme.primary
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
                      ? Theme.of(context).colorScheme.primary
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
  }) : super(key: key);

  final Widget child;

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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.pink,
              ),
              height: MediaQuery.of(context).size.height / 3.5,
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
