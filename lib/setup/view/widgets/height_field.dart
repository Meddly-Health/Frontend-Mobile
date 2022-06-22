import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/setup/cubit/setup_cubit.dart';

import '../../../helpers/helpers.dart';

class HeightField extends StatelessWidget {
  const HeightField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        bool showErrorText = state.height.value == 0.0 && state.height.invalid;

        return TextFormField(
            enabled: state.enabled,
            key: const Key('user_height'),
            textInputAction: TextInputAction.next,
            onChanged: (String? value) {
              if (value!.isEmpty) {
                return context.read<SetupCubit>().heightChanged(-1);
              }

              int? height = int.tryParse(value);

              height ??= 0;

              context.read<SetupCubit>().heightChanged(height);
            },
            controller: context.read<SetupCubit>().heightController,
            keyboardType: TextInputType.number,
            inputFormatters: const [],
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: 'Ej: 175',
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
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
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
              errorText: !showErrorText ? null : 'La altura es inválida.',
              errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
              labelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
              suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: showCheckIcon(
                      state.height.valid && state.height.value != null,
                      context)),
              suffixText: 'cm',
              suffixStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w500),
              suffixIconConstraints: const BoxConstraints(
                  maxHeight: 30, maxWidth: 38, minHeight: 30, minWidth: 38),
            ));
      },
    );
  }
}
