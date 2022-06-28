import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/setup/cubit/setup_cubit.dart';

import '../../../helpers/helpers.dart';

class WeightField extends StatelessWidget {
  const WeightField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        bool showErrorText = state.weight.value == 0.0 && state.weight.invalid;

        return TextFormField(
            key: const Key('user_weight'),
            textInputAction: TextInputAction.next,
            controller: context.read<SetupCubit>().weightController,
            onChanged: (String? value) {
              if (value!.isEmpty) {
                return context.read<SetupCubit>().weightChanged(-1);
              }

              if (value.contains(',')) {
                value = value.replaceAll(',', '.');
              }

              double? weight = double.tryParse(value);
              weight ??= 0;

              context.read<SetupCubit>().weightChanged(weight);
            },
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: 'Ej: 80',
              errorText: !showErrorText ? null : 'El peso es inválido.',
              suffixIcon: Row(
                children: [
                  if (state.weight.valid)
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: showCheckIcon(
                          state.weight.valid && state.weight.value != null,
                          context),
                    ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: const Text('kg'),
                  ),
                ],
              ),
              suffixStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w500),
              suffixIconConstraints: BoxConstraints(
                maxHeight: 30,
                maxWidth: state.weight.valid ? 60 : 30,
              ),
            ));
      },
    );
  }
}
