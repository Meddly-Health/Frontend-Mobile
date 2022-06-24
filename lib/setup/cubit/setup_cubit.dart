import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:form_helper/form_helper.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:meddly/helpers/assets_provider.dart';
import 'package:meddly/helpers/helpers.dart';
import 'package:user_repository/user_repository.dart';

part 'setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  SetupCubit(
    userRepository,
    authenticationRepository,
  )   : _userRepository = userRepository,
        super(const SetupState());

  final UserRepository _userRepository;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  PageController? pageController;

  void init([bool enableValue = true, User? currentUser]) async {
    emit(state.copyWith(enabled: enableValue));

    if (currentUser == null) return;

    var name = currentUser.firstName != null
        ? Name.dirty(currentUser.firstName!)
        : const Name.pure();
    var lastName = currentUser.lastName != null
        ? LastName.dirty(currentUser.lastName!)
        : const LastName.pure();

    var birthDate = currentUser.birth != null
        ? BirthDate.dirty(currentUser.birth!)
        : const BirthDate.pure();

    var height = currentUser.height != null
        ? Heigth.dirty(currentUser.height?.toInt())
        : const Heigth.pure();

    var weight = currentUser.weight != null
        ? Weight.dirty(currentUser.weight!)
        : const Weight.pure();

    var avatar = currentUser.avatar != null &&
            currentUser.avatar != AssetsProvider.defaultAvatar
        ? currentUser.avatar!
        : AssetsProvider.defaultAvatar;

    nameController.text = currentUser.firstName ?? '';
    lastNameController.text = currentUser.lastName ?? '';

    if (currentUser.height != null) {
      heightController.text = currentUser.height!.toInt().toString();
    }
    if (currentUser.weight != null) {
      weightController.text = currentUser.weight.toString();
    }

    emit(
      state.copyWith(
          name: name,
          lastName: lastName,
          birthDate: birthDate,
          height: height,
          weight: weight,
          sex: currentUser.sex,
          avatar: avatar),
    );
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

  void avatarType(String value) {
    emit(state.copyWith(
        avatar: state.avatar.replaceCharAt(state.avatar, 20, value)));
  }

  void hairColorChanged(String value) {
    emit(
      state.copyWith(
          avatar: state.avatar.replaceCharAt(state.avatar, 24, value)),
    );
  }

  void skinColorChanged(String value) {
    emit(
      state.copyWith(
        avatar: state.avatar.replaceCharAt(state.avatar, 22, value),
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
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    User user = User(
        firstName: state.name.value.capitalize(),
        lastName: state.lastName.value.capitalize(),
        birth: state.birthDate.value,
        avatar: state.avatar,
        height: state.height.value?.toDouble(),
        weight: state.weight.value,
        sex: state.sex);

    var response = await _userRepository.updateUser(user);

    response.fold(
        (UserException l) => emit(state.copyWith(
            errorMessage: l.message,
            status: FormzStatus.submissionFailure)), (User r) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      if (pageController != null && pageController!.hasClients) {
        pageController!.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
