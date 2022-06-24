import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';

import '../../blocs.dart';
import '../../helpers/assets_provider.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class BirthDatePage extends StatelessWidget {
  const BirthDatePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Center(child: Lottie.asset(AssetsProvider.medic1)),
        ),
        const SizedBox(height: 16),
        Text(
          '¿Cuál es tu fecha de nacimiento?',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 25),
        const BirthDateField(),
        const Spacer(),
        BlocBuilder<SetupCubit, SetupState>(
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: Button(
                    enabled: true,
                    onPressed: () {
                      if (state.status.isSubmissionInProgress) return;
                      context.read<SetupCubit>().pageController!.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut);
                    },
                    animate: false,
                    enabledColor: Theme.of(context).colorScheme.primary,
                    disbaledColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    labelColor: Theme.of(context).colorScheme.secondary,
                    label: 'Volver atrás',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Button(
                      enabled: state.birthDate.valid,
                      onPressed: () {
                        if (state.status.isSubmissionInProgress) return;
                        HapticFeedback.lightImpact();
                        if (state.birthDate.valid) {
                          context.read<SetupCubit>().saveUserData();
                        }
                      },
                      animate: state.status.isSubmissionInProgress,
                      enabledColor: Theme.of(context).colorScheme.primary,
                      disbaledColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                      labelColor: Theme.of(context).colorScheme.secondary,
                      label: 'Siguiente',
                      keyString: 'next'),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 16),
        const OmitButton()
      ],
    );
  }
}
