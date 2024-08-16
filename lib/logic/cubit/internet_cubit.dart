import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;

  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternetConnection();
  }
  StreamSubscription<List<ConnectivityResult>> monitorInternetConnection(){
    return   connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult.contains(ConnectivityResult.wifi)) {
        emitInternetConnected(ConnectionType.Wifi);
      } else if (connectivityResult.contains(ConnectivityResult.mobile)) {
        emitInternetConnected(ConnectionType.Mobile);
      } else if (connectivityResult.contains(ConnectivityResult.none)) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType connectedType) =>
      emit(InternetConnected(connectionType: connectedType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
