part of 'supervisors_bloc.dart';

@freezed
class SupervisorsState with _$SupervisorsState {
  const factory SupervisorsState.initial() = _InitialState;
  const factory SupervisorsState.loading() = _LoadingState;
  const factory SupervisorsState.success({
    List<User>? supervisors,
    List<User>? supervised,
  }) = _SuccessState;
  const factory SupervisorsState.error({required String errorMessage}) =
      _ErrorState;
  const factory SupervisorsState.deleted() = _DeletedState;
  const factory SupervisorsState.added() = _AddedState;
}
