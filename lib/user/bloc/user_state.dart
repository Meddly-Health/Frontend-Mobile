// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

@immutable
class UserState extends Equatable {
  final User? currentUser;
  final UserStatus status;
  final String? errorMessage;

  const UserState({
    this.currentUser,
    this.status = UserStatus.initial,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        currentUser,
        status,
        errorMessage,
      ];

  UserState copyWith(
      {User? currentUser,
      UserStatus? status,
      String? errorMessage,
      FormzStatus? formStatus,
      Name? name,
      LastName? lastName,
      BirthDate? birthDate,
      Heigth? height,
      Weight? weight,
      Sex? sex,
      bool? enabled}) {
    return UserState(
      currentUser: currentUser ?? this.currentUser,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum UserStatus { initial, loading, success, error }
