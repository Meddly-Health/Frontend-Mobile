import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:form_helper/form_helper.dart';
import 'package:formz/formz.dart';
import 'package:meddly/user/api/user_api.dart';
import 'package:meddly/user/bloc/user_bloc.dart';
import 'package:meddly/user/models/user.dart';
import 'package:meddly/user/repository/respository.dart';
import 'package:equatable/equatable.dart';

part 'user_form_state.dart';

class UserFormCubit extends Cubit<UserFormState> {
  UserFormCubit({required userRepository, required authenticationRepository})
      : _userRepository = userRepository,
        _authenticationRepository = authenticationRepository,
        super(const UserFormState());

  final UserRepository _userRepository;
  final AuthenticationRepository _authenticationRepository;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  void init([bool enableValue = true]) async {
    emit(state.copyWith(userStatus: UserStatus.loading));
    var response =
        await _userRepository.getUser(_authenticationRepository.currentUser.id);

    response.fold(
        (UserException l) => emit(state.copyWith(
            userStatus: UserStatus.error, errorMessage: l.message)), (User r) {
      emit(
        state.copyWith(
            enabled: enableValue,
            userStatus: UserStatus.success,
            name: r.firstName != null
                ? Name.dirty(r.firstName!)
                : const Name.pure(),
            lastName: r.lastName != null
                ? LastName.dirty(r.lastName!)
                : const LastName.pure(),
            birthDate: r.birth != null
                ? BirthDate.dirty(r.birth!)
                : const BirthDate.pure(),
            height: r.height != null
                ? Heigth.dirty(r.height?.toInt())
                : const Heigth.pure(),
            weight: r.weight != null
                ? Weight.dirty(r.weight!)
                : const Weight.pure(),
            sex: r.sex),
      );

      nameController.text = r.firstName ?? '';
      lastNameController.text = r.lastName ?? '';
      if (r.height != null) {
        heightController.text = r.height!.toInt().toString();
      }
      if (r.weight != null) weightController.text = r.weight.toString();
    });
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

    var response = await _userRepository.updateUser(user);

    response.fold(
        (UserException l) => emit(state.copyWith(
            status: FormzStatus.submissionFailure, errorMessage: l.message)),
        (User r) =>
            emit(state.copyWith(status: FormzStatus.submissionSuccess)));
  }
}
