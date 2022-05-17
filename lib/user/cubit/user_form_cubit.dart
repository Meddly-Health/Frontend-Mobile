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
  UserFormCubit(this._userRepository, this._authenticationRepository)
      : super(const UserFormState());

  final UserRepository _userRepository;
  final AuthenticationRepository _authenticationRepository;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  void init() async {
    emit(state.copyWith(userStatus: UserStatus.loading));
    var response =
        await _userRepository.getUser(_authenticationRepository.currentUser.id);

    response.fold(
        (UserException l) => emit(state.copyWith(
            userStatus: UserStatus.error, errorMessage: l.message)), (User r) {
      emit(
        state.copyWith(
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
                ? Heigth.dirty(r.height!)
                : const Heigth.pure(),
            weight: r.weight != null
                ? Weigth.dirty(r.weight!)
                : const Weigth.pure(),
            sex: r.sex),
      );

      nameController.text = r.firstName ?? '';
      lastNameController.text = r.lastName ?? '';
      if (r.height != null) heightController.text = r.height.toString();
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

  void heightChanged(double value) {
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

  void saveUserData() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    User user = User(
        firstName: state.name.value,
        lastName: state.lastName.value,
        birth: state.birthDate.value,
        height: state.height.value,
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
