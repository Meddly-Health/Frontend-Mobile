part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _InitialState;
  const factory UserState.loading() = _LoadingState;
  const factory UserState.success({
    User? currentUser,
    User? supervising,
  }) = _SuccessState;
  const factory UserState.error(String errorMessage) = _ErrorState;
}

enum UserStatus { initial, loading, success, error }
