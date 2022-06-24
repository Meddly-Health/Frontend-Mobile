import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';
import 'package:meddly/setup/view/widgets/height_field.dart';
import 'package:meddly/setup/view/widgets/widgets.dart';
import 'package:meddly/setup/view/widgets/weight_field.dart';

import '../../blocs.dart';
import '../../helpers/assets_provider.dart';
import '../../widgets/widgets.dart';

class HeightWeightPage extends StatelessWidget {
  const HeightWeightPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Center(child: Lottie.asset(AssetsProvider.medic5)),
        ),
        const SizedBox(height: 16),
        const _Form(),
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
                      enabled: state.height.valid &&
                          state.height.value != null &&
                          state.weight.valid &&
                          state.weight.value != null,
                      onPressed: () {
                        if (state.status.isSubmissionInProgress) return;
                        if (state.height.valid &&
                            state.height.value != null &&
                            state.weight.valid &&
                            state.weight.value != null) {
                          HapticFeedback.lightImpact();
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

class _Form extends StatelessWidget {
  const _Form({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Peso',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 16),
        const WeightField(),
        const SizedBox(height: 16),
        Text('Altura',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 16),
        const HeightField(),
      ],
    );
  }
}
