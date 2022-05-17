part of 'user_bloc.dart';

@immutable
class UserState extends Equatable {
  final User? currentUser;
  final UserStatus status;
  final String? errorMessage;
  const UserState(
      {this.currentUser, this.status = UserStatus.initial, this.errorMessage});

  @override
  List<Object?> get props => [currentUser, status, errorMessage];

  UserState copyWith({
    User? currentUser,
    UserStatus? status,
    String? errorMessage,
  }) {
    return UserState(
      currentUser: currentUser ?? this.currentUser,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum UserStatus { initial, loading, success, error }
