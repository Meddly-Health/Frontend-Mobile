import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/helpers/constants.dart';

import '../../blocs.dart';
import '../../helpers/helpers.dart';

class UserDataForm extends StatelessWidget {
  const UserDataForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        _NameField(),
        SizedBox(height: 16),
        _LastNameField(),
        SizedBox(height: 16),
        _DatePicker(),
        SizedBox(height: 16),
        _WeightField(),
        SizedBox(height: 16),
        _HeightField(),
        SizedBox(height: 16),
        _SexDropDown(),
      ],
    );
  }
}

class _SexDropDown extends StatelessWidget {
  const _SexDropDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFormCubit, UserFormState>(
      builder: (context, state) {
        return Container(
          height: 60,
          padding: defaultPadding,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width,
          child: DropdownButtonHideUnderline(
              child: DropdownButton<bool>(
            value: state.sex,
            style: Theme.of(context).textTheme.bodyMedium,
            dropdownColor: Theme.of(context).colorScheme.secondary,
            icon: Transform.rotate(
                angle: 11, child: const Icon(Icons.chevron_left)),
            items: const <DropdownMenuItem<bool>>[
              DropdownMenuItem<bool>(
                child: Text(
                  'Femenino',
                ),
                value: false,
              ),
              DropdownMenuItem<bool>(
                child: Text(
                  'Masculino',
                ),
                value: true,
              ),
            ],
            onChanged: (bool? value) {
              context.read<UserFormCubit>().sexChanged(value!);
            },
          )),
        );
      },
    );
  }
}

// TODO: Show error if the user is not over 18.

class _DatePicker extends StatelessWidget {
  const _DatePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var _dateTime = await showDatePicker(
            context: context,
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now());

        if (_dateTime != null) {
          context.read<UserFormCubit>().birthDateChanged(_dateTime);
        }
      },
      child: BlocBuilder<UserFormCubit, UserFormState>(
        builder: (context, state) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 60,
            padding: defaultPadding,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: state.birthDate.valid || state.birthDate.value == null
                  ? null
                  : Border.all(color: Theme.of(context).colorScheme.error),
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  state.birthDate.value == null
                      ? 'Fecha de Nacimiento'
                      : formatDate(state.birthDate.value!),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                const Icon(Icons.calendar_month_rounded)
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFormCubit, UserFormState>(
      builder: (context, state) {
        bool showErrorText = state.name.value.isNotEmpty && state.name.invalid;

        return TextFormField(
            key: const Key('user_name'),
            textInputAction: TextInputAction.next,
            onChanged: (String? value) {
              context.read<UserFormCubit>().nameChanged(value!);
            },
            keyboardType: TextInputType.name,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: 'Nombre',
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
              errorText: !showErrorText ? null : 'El nombre es inválido.',
              errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
              labelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
              suffixIcon: showCheckIcon(state.name.valid, context),
              suffixIconConstraints: const BoxConstraints(
                  maxHeight: 30, maxWidth: 30, minHeight: 30, minWidth: 30),
            ));
      },
    );
  }
}

class _LastNameField extends StatelessWidget {
  const _LastNameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFormCubit, UserFormState>(
      builder: (context, state) {
        bool showErrorText =
            state.lastName.value.isNotEmpty && state.lastName.invalid;

        return TextFormField(
            key: const Key('user_last_name'),
            textInputAction: TextInputAction.next,
            onChanged: (String? value) {
              context.read<UserFormCubit>().lastNameChanged(value!);
            },
            keyboardType: TextInputType.name,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: 'Apellido',
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
              errorText: !showErrorText ? null : 'El apellido es inválido.',
              errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
              labelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: state.errorMessage == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium,
              suffixIcon: showCheckIcon(state.lastName.valid, context),
              suffixIconConstraints: const BoxConstraints(
                  maxHeight: 30, maxWidth: 30, minHeight: 30, minWidth: 30),
            ));
      },
    );
  }
}

class _WeightField extends StatelessWidget {
  const _WeightField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFormCubit, UserFormState>(
      builder: (context, state) {
        bool showErrorText = state.weight.value == 0.0 && state.weight.invalid;

        return TextFormField(
            key: const Key('user_weight'),
            textInputAction: TextInputAction.next,
            initialValue: state.weight.value.toStringAsFixed(2),
            onChanged: (String? value) {
              double? weight = double.tryParse(value!);

              weight ??= 0;

              context.read<UserFormCubit>().weightChanged(weight);
            },
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: const [],
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
                hintText: 'Peso',
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
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary),
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
                errorText: !showErrorText ? null : 'El peso es inválido.',
                errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                labelStyle: state.errorMessage == null
                    ? Theme.of(context).textTheme.bodyMedium
                    : Theme.of(context).textTheme.bodyMedium,
                floatingLabelStyle: state.errorMessage == null
                    ? Theme.of(context).textTheme.bodyMedium
                    : Theme.of(context).textTheme.bodyMedium,
                suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Kg'),
                      if (state.weight.valid &&
                          state.weight.value > 0 &&
                          state.weight.value < 1000)
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: showCheckIcon(
                              state.weight.valid && state.weight.value > 0,
                              context),
                        )
                    ]),
                suffixIconConstraints: const BoxConstraints(
                    maxHeight: 30, maxWidth: 60, minHeight: 30, minWidth: 60)));
      },
    );
  }
}

class _HeightField extends StatelessWidget {
  const _HeightField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFormCubit, UserFormState>(
      builder: (context, state) {
        bool showErrorText = state.height.value == 0.0 && state.height.invalid;

        return TextFormField(
            key: const Key('user_height'),
            textInputAction: TextInputAction.next,
            initialValue: state.height.value.toStringAsFixed(2),
            onChanged: (String? value) {
              double? height = double.tryParse(value!);

              height ??= 0;

              context.read<UserFormCubit>().heigthChanged(height);
            },
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: const [],
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: 'Altura',
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
              suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('metros'),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: showCheckIcon(
                          state.height.valid && state.height.value > 0,
                          context),
                    )
                  ]),
              suffixIconConstraints: const BoxConstraints(
                  maxHeight: 30, maxWidth: 90, minHeight: 30, minWidth: 60),
            ));
      },
    );
  }
}
