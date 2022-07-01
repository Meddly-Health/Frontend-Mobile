import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';
import 'package:meddly/setup/view/widgets/height_field.dart';
import 'package:meddly/setup/view/widgets/weight_field.dart';

import '../../blocs.dart';
import '../../helpers/assets_provider.dart';
import '../../helpers/constants.dart';
import '../../widgets/button.dart';

class SetupHeightWeightPage extends StatelessWidget {
  const SetupHeightWeightPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: defaultPadding,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(child: Lottie.asset(AssetsProvider.medic5)),
                ),
                const _Form(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
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
          const SizedBox(height: 35),
          BlocBuilder<SetupCubit, SetupState>(
            builder: (context, state) {
              return Button(
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
                      FocusScope.of(context).unfocus();
                      context.read<SetupCubit>().next();
                    }
                  },
                  animate: state.status.isSubmissionInProgress,
                  enabledColor: Theme.of(context).colorScheme.primary,
                  disbaledColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  labelColor: Theme.of(context).colorScheme.secondary,
                  label: 'Siguiente',
                  keyString: 'next');
            },
          ),
        ],
      ),
    );
  }
}
