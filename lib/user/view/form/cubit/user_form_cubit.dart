import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:form_helper/form_helper.dart';
import 'package:formz/formz.dart';
import 'package:meddly/user/bloc/user_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/user.dart';

part 'user_form_state.dart';

class UserFormCubit extends Cubit<UserFormState> {
  UserFormCubit({required userRepository, required UserBloc userBloc})
      : _userBloc = userBloc,
        super(const UserFormState());

  final UserBloc _userBloc;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  void init([bool enableValue = true]) async {
    var currentUser = _userBloc.state.currentUser;
    if (currentUser == null) {
      emit(UserFormState(enabled: enableValue));
    } else {
      emit(state.copyWith(
          enabled: enableValue,
          name: currentUser.firstName != null
              ? Name.dirty(currentUser.firstName!)
              : const Name.pure(),
          lastName: currentUser.lastName != null
              ? LastName.dirty(currentUser.lastName!)
              : const LastName.pure(),
          birthDate: currentUser.birth != null
              ? BirthDate.dirty(currentUser.birth!)
              : const BirthDate.pure(),
          height: currentUser.height != null
              ? Heigth.dirty(currentUser.height?.toInt())
              : const Heigth.pure(),
          weight: currentUser.weight != null
              ? Weight.dirty(currentUser.weight!)
              : const Weight.pure(),
          sex: currentUser.sex));

      nameController.text = _userBloc.state.currentUser!.firstName ?? '';
      lastNameController.text = _userBloc.state.currentUser!.lastName ?? '';
      if (_userBloc.state.currentUser!.height != null) {
        heightController.text = currentUser.height!.toInt().toString();
      }
      if (_userBloc.state.currentUser!.weight != null) {
        weightController.text = _userBloc.state.currentUser!.weight.toString();
      }
    }
  }

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(
      state.copyWith(
        name: name,
        status: Formz.validate([
          name,
          state.lastName,
          state.weight,
          state.height,
          state.birthDate
        ]),
      ),
    );
  }

  void lastNameChanged(String value) {
    final lastName = LastName.dirty(value);
    emit(
      state.copyWith(
        lastName: lastName,
        status: Formz.validate([
          lastName,
          state.name,
          state.weight,
          state.height,
          state.birthDate
        ]),
      ),
    );
  }

  void birthDateChanged(DateTime value) {
    final birthDate = BirthDate.dirty(value);
    emit(state.copyWith(
      birthDate: birthDate,
      status: Formz.validate([
        birthDate,
        state.name,
        state.lastName,
        state.weight,
        state.height,
      ]),
    ));
  }

  void enableForm(bool value) {
    emit(state.copyWith(enabled: value));
  }

  void weightChanged(double? value) {
    if (value != -1) {
      final weight = Weight.dirty(value);
      emit(state.copyWith(
          weight: weight,
          status: Formz.validate([
            weight,
            state.lastName,
            state.name,
            state.birthDate,
            state.height
          ])));
    } else {
      emit(state.copyWith(weight: const Weight.pure()));
    }
  }

  void heightChanged(int? value) {
    if (value != -1) {
      final heigth = Heigth.dirty(value);
      emit(state.copyWith(
          height: heigth,
          status: Formz.validate([
            heigth,
            state.lastName,
            state.name,
            state.weight,
            state.birthDate
          ])));
    } else {
      emit(state.copyWith(height: const Heigth.pure()));
    }
  }

  void sexChanged(Sex? value) {
    emit(state.copyWith(
        sex: value,
        status: Formz.validate([
          state.height,
          state.lastName,
          state.name,
          state.weight,
          state.birthDate
        ])));
  }

  Future<void> saveUserData() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    User user = User(
        firstName: state.name.value,
        lastName: state.lastName.value,
        birth: state.birthDate.value,
        height: state.height.value?.toDouble(),
        weight: state.weight.value,
        sex: state.sex);

    _userBloc.add(UserUpdate(user: user));
    if (_userBloc.state.status == UserStatus.success) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
    if (_userBloc.state.status == UserStatus.error) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
