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
              errorText: !showErrorText ? null : 'La altura es inválida.',
              suffixIcon: Row(
                children: [
                  if (state.height.valid)
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: showCheckIcon(
                          state.height.valid && state.height.value != null,
                          context),
                    ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: const Text('cm'),
                  ),
                ],
              ),
              suffixStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w500),
              suffixIconConstraints: BoxConstraints(
                  maxHeight: 30, maxWidth: state.height.valid ? 70 : 35),
            ));
      },
    );
  }
}
