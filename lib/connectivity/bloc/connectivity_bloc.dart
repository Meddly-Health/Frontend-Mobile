import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  late final StreamSubscription<ConnectivityResult> _suscription;

  ConnectivityBloc() : super(const ConnectivityState()) {
    on<ConnectivityCheckEvent>((event, emit) {
      emit(state.copyWith(connectivityResult: event.connectivityResult));
    });

    _checkConnectivity();
    _connectivityStream();
  }

  void _checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    add(ConnectivityCheckEvent(connectivityResult));
  }

  void _connectivityStream() {
    _suscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      add(ConnectivityCheckEvent(result));
    });
  }

  @override
  Future<void> close() {
    _suscription.cancel();
    return super.close();
  }
}
