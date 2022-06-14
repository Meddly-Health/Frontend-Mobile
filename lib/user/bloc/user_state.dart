part of 'user_bloc.dart';

@immutable
class UserState extends Equatable {
  final User? currentUser;
  final UserStatus status;
  final String? errorMessage;
  final User? supervising;

  const UserState({
    this.currentUser,
    UserStatus? status,
    this.errorMessage,
    User? supervising,
  })  : status = status ?? UserStatus.initial,
        supervising = supervising ?? User.empty;

  @override
  List<Object?> get props => [currentUser, status, errorMessage, supervising];

  UserState copyWith(
      {User? currentUser,
      required UserStatus status,
      String? errorMessage,
      User? supervising}) {
    return UserState(
        currentUser: currentUser ?? this.currentUser,
        status: status,
        errorMessage: errorMessage ?? this.errorMessage,
        supervising: supervising ?? this.supervising);
  }
}

enum UserStatus { initial, loading, success, error }
