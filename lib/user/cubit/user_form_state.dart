part of 'user_form_cubit.dart';

@immutable
class UserFormState extends Equatable {
  final FormzStatus status;
  final Name name;
  final UserStatus userStatus;
  final LastName lastName;
  final BirthDate birthDate;
  final Heigth height;
  final Weigth weight;
  final Sex? sex;
  final String? errorMessage;

  bool get isValid => status.isValid;

  const UserFormState(
      {this.status = FormzStatus.pure,
      this.name = const Name.pure(),
      this.lastName = const LastName.pure(),
      this.birthDate = const BirthDate.pure(),
      this.height = const Heigth.pure(),
      this.weight = const Weigth.pure(),
      this.sex,
      this.userStatus = UserStatus.initial,
      this.errorMessage});

  @override
  List<Object?> get props => [
        status,
        name,
        lastName,
        birthDate,
        height,
        weight,
        sex,
        errorMessage,
        userStatus
      ];

  UserFormState copyWith(
      {FormzStatus? status,
      Name? name,
      LastName? lastName,
      BirthDate? birthDate,
      Heigth? height,
      Weigth? weight,
      Sex? sex,
      String? errorMessage,
      UserStatus? userStatus}) {
    return UserFormState(
        status: status ?? this.status,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        birthDate: birthDate ?? this.birthDate,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        sex: sex ?? this.sex,
        errorMessage: errorMessage ?? this.errorMessage,
        userStatus: userStatus ?? this.userStatus);
  }
}
