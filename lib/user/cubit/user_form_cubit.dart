import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:form_helper/form_helper.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'user_form_state.dart';

class UserFormCubit extends Cubit<UserFormState> {
  UserFormCubit() : super(const UserFormState());

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

  void weightChanged(double value) {
    final weight = Weigth.dirty(value);
    emit(state.copyWith(
        weight: weight,
        status: Formz.validate([
          weight,
          state.lastName,
          state.name,
          state.birthDate,
          state.height
        ])));
  }

  void heigthChanged(double value) {
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
  }

  void sexChanged(bool value) {
    emit(state.copyWith(sex: value));
  }
}
