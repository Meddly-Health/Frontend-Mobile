part of 'supervisors_bloc.dart';

@immutable
class SupervisorsState extends Equatable {
  final List<User>? supervisors;
  final List<User>? supervised;
  final SupervisorsStatus status;
  final String? errorMessage;

  const SupervisorsState({
    this.supervisors,
    this.supervised,
    this.errorMessage,
    this.status = SupervisorsStatus.initial,
  });

  SupervisorsState copyWith({
    List<User>? supervisors,
    List<User>? supervised,
    required SupervisorsStatus status,
    String? errorMessage,
  }) {
    return SupervisorsState(
      supervisors: supervisors ?? this.supervisors,
      supervised: supervised ?? this.supervised,
      status: status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        supervisors,
        supervised,
        status,
        errorMessage,
      ];
}

enum SupervisorsStatus { initial, loading, success, error }
