import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../blocs.dart';
import '../../../helpers/assets_provider.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/helpers.dart';

class BirthDateField extends StatelessWidget {
  const BirthDateField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!context.read<SetupCubit>().state.enabled) return;
        HapticFeedback.lightImpact();

        var _dateTime = await showDatePicker(
          context: context,
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDatePickerMode: DatePickerMode.year,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (_dateTime != null) {
          context.read<SetupCubit>().birthDateChanged(_dateTime);
        }
      },
      child: BlocBuilder<SetupCubit, SetupState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10),
                  border: state.enabled
                      ? null
                      : Border.all(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 60,
                  padding: defaultPadding,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border:
                        state.birthDate.valid || state.birthDate.value == null
                            ? null
                            : Border.all(
                                color: Theme.of(context).colorScheme.error),
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text(
                        state.birthDate.value == null
                            ? 'Selecciona una fecha'
                            : formatDate(state.birthDate.value!),
                        style: state.birthDate.value == null
                            ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color!
                                    .withOpacity(0.5))
                            : Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset(AssetsProvider.calendarIcon))
                    ],
                  ),
                ),
              ),
              state.birthDate.valid || state.birthDate.value == null
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('   La edad debe ser mayor a 18 años.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.error)),
                    ),
            ],
          );
        },
      ),
    );
  }
}
