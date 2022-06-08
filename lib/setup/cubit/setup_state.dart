part of 'setup_cubit.dart';

@immutable
class SetupState extends Equatable {
  final FormzStatus status;
  final Name name;
  final LastName lastName;
  final BirthDate birthDate;
  final Heigth height;
  final Weight weight;
  final Sex? sex;
  final String? errorMessage;
  final bool enabled;

  bool get isValid =>
      name.valid &&
      lastName.valid &&
      (birthDate.valid || birthDate.pure) &&
      (weight.valid || weight.pure) &&
      (height.valid || birthDate.pure);

  const SetupState(
      {this.status = FormzStatus.pure,
      this.name = const Name.pure(),
      this.lastName = const LastName.pure(),
      this.birthDate = const BirthDate.pure(),
      this.height = const Heigth.pure(),
      this.weight = const Weight.pure(),
      this.sex,
      this.errorMessage,
      this.enabled = true});

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
        enabled
      ];

  SetupState copyWith({
    FormzStatus? status,
    Name? name,
    LastName? lastName,
    BirthDate? birthDate,
    Heigth? height,
    Weight? weight,
    Sex? sex,
    String? errorMessage,
    bool? enabled,
  }) {
    return SetupState(
      status: status ?? this.status,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      sex: sex ?? this.sex,
      enabled: enabled ?? this.enabled,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
