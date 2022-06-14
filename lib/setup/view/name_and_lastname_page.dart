import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';

import '../../blocs.dart';
import '../../helpers/assets_provider.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class NameAndLastNamePage extends StatelessWidget {
  const NameAndLastNamePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Center(child: Lottie.asset(AssetsProvider.medic4)),
        ),
        const SizedBox(height: 16),
        Text(
          '¿Cómo te llamas?',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        const _Form(),
        const Spacer(),
        BlocBuilder<SetupCubit, SetupState>(
          builder: (context, state) {
            return Button(
                enabled: state.name.valid && state.lastName.valid,
                onPressed: () {
                  if (state.status.isSubmissionInProgress) return;
                  if (state.name.valid && state.lastName.valid) {
                    HapticFeedback.lightImpact();
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

class _Form extends StatelessWidget {
  const _Form({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}
