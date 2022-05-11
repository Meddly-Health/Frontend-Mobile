part of 'connectivity_bloc.dart';

@immutable
class ConnectivityState {
  final ConnectivityResult connectivityResult;

  const ConnectivityState({this.connectivityResult = ConnectivityResult.none});

  ConnectivityState copyWith({
    ConnectivityResult? connectivityResult,
  }) {
    return ConnectivityState(
      connectivityResult: connectivityResult ?? this.connectivityResult,
    );
  }
}
