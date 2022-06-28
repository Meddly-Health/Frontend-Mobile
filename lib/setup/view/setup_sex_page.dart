import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';
import 'package:user_repository/user_repository.dart';

import '../../blocs.dart';
import '../../helpers/assets_provider.dart';
import '../../helpers/constants.dart';
import '../../widgets/widgets.dart';

class SetupSexPage extends StatelessWidget {
  const SetupSexPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: defaultPadding,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Center(child: Lottie.asset(AssetsProvider.medic2)),
              ),
              const SizedBox(height: 16),
              Container(
                padding: defaultPadding,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hola hola, ¿eres hombre o mujer?',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 35),
                      child: _ChooseSex(),
                    ),
                    const _WhyOnly2Genders(),
                    const SizedBox(height: 25),
                    BlocBuilder<SetupCubit, SetupState>(
                      builder: (context, state) {
                        return Button(
                            enabled: state.sex != null,
                            onPressed: () {
                              if (state.status.isSubmissionInProgress) return;
                              HapticFeedback.lightImpact();
                              if (state.sex != null) {
                                context.read<SetupCubit>().next();
                              }
                            },
                            animate: state.status.isSubmissionInProgress,
                            enabledColor: Theme.of(context).colorScheme.primary,
                            disbaledColor: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            labelColor: Theme.of(context).colorScheme.secondary,
                            label: 'Siguiente',
                            keyString: 'next');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChooseSex extends StatelessWidget {
  const _ChooseSex({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<SetupCubit, SetupState>(
          builder: (context, state) {
            bool isFemale = state.sex != null && state.sex! == Sex.femenino;
            bool isMale = state.sex != null && state.sex! == Sex.masculino;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<SetupCubit>().sexChanged(Sex.masculino);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    padding: defaultPadding,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isMale
                          ? Theme.of(context).colorScheme.secondaryContainer
                          : Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hombre',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: isMale
                                      ? Theme.of(context).colorScheme.secondary
                                      : null),
                        ),
                        if (isMale) ...[
                          const SizedBox(width: 16),
                          ElasticIn(
                              child: SvgPicture.asset(AssetsProvider.success))
                        ]
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    context.read<SetupCubit>().sexChanged(Sex.femenino);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    padding: defaultPadding,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isFemale
                          ? Theme.of(context).colorScheme.secondaryContainer
                          : Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Mujer',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: isFemale
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : null)),
                        if (isFemale) ...[
                          const SizedBox(width: 16),
                          ElasticIn(
                              child: SvgPicture.asset(AssetsProvider.success))
                        ]
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}

class _WhyOnly2Genders extends StatelessWidget {
  const _WhyOnly2Genders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
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
                                color: Theme.of(context).colorScheme.primary),
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
            )));
  }
}
