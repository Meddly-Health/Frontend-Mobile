import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_helper/form_helper.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meddly/helpers/assets_provider.dart';
import 'package:meddly/helpers/extensions.dart';
import 'package:user_repository/user_repository.dart';

part 'setup_state.dart';
part 'setup_cubit.freezed.dart';

class SetupCubit extends Cubit<SetupState> {
  SetupCubit(
    userRepository,
    authenticationRepository,
  )   : _userRepository = userRepository,
        _authenticationRepository = authenticationRepository,
        super(const SetupState());

  final UserRepository _userRepository;
  final AuthenticationRepository _authenticationRepository;
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  TabsRouter? tabsRouter;

  void init() async {
    emit(state.copyWith(setupStatus: SetupStatus.loading));
    var response =
        await _userRepository.getUser(_authenticationRepository.currentUser.id);

    response.fold(
        (e) => emit(SetupState(
            errorMessage: e.message,
            setupStatus: SetupStatus.error)), (currentUser) {
      if (currentUser.height != null) {
        heightController.text = currentUser.height!.toInt().toString();
      }
      if (currentUser.weight != null) {
        weightController.text = currentUser.weight.toString();
      }

      emit(SetupState(
        currentUser: currentUser,
        sex: currentUser.sex,
        weight: Weight.dirty(currentUser.weight),
        height: Heigth.dirty(currentUser.height?.toInt()),
        avatar: currentUser.avatar!,
        status: Formz.validate([
          Weight.dirty(currentUser.weight),
          Heigth.dirty(currentUser.height?.toInt()),
        ]),
      ));
    });
  }

  void avatarType(String value) {
    emit(state.copyWith(
        avatar: state.avatar.replaceCharAt(state.avatar, 20, value)));
  }

  void hairColorChanged(String value) {
    emit(state.copyWith(
        avatar: state.avatar.replaceCharAt(state.avatar, 24, value)));
  }

  void skinColorChanged(String value) {
    emit(state.copyWith(
      avatar: state.avatar.replaceCharAt(state.avatar, 22, value),
    ));
  }

  void weightChanged(double? value) {
    if (value != -1) {
      final weight = Weight.dirty(value);
      emit(state.copyWith(
          weight: weight,
          status: Formz.validate([
            weight,
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
          ])));
    } else {
      emit(state.copyWith(height: const Heigth.pure()));
    }
  }

  void next() {
    tabsRouter!.setActiveIndex(tabsRouter!.activeIndex + 1);
  }

  void sexChanged(Sex? value) {
    emit(state.copyWith(sex: value));
  }

  Future<void> saveUserData() async {
    emit(state.copyWith(setupStatus: SetupStatus.saving));

    User _userUpdate = state.currentUser.copyWith(
        sex: state.sex,
        weight: state.weight.value,
        height: state.height.value?.toDouble(),
        avatar: state.avatar);

    var response = await _userRepository.updateUser(_userUpdate);

    response.fold(
        (UserException error) => emit(state.copyWith(
            errorMessage: error.message, setupStatus: SetupStatus.error)),
        (User r) => emit(state.copyWith(setupStatus: SetupStatus.success)));
  }
}
