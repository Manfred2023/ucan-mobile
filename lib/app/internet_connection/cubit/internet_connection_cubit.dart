// Created by Manfred MOUKATE on 6/21/24, 5:35 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/21/24, 5:35 PM

import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import '../../config/enum.dart';

part 'internet_connection_state.dart';

/// mobil App is connect
class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  /// {@macro internet_connection_cubit}
  InternetConnectionCubit({
    required this.connectivity,
    this.connectivityStreamSubscription,
  }) : super(InternetConnectionInitial()) {
    monitorInternet();
  }

  /// to check connection
  final Connectivity connectivity;

  ///  subscription on events from a Stream .
  StreamSubscription? connectivityStreamSubscription;

  /// Stream listen type of connection
  /// Connection status check result.
  Future<StreamSubscription<ConnectivityResult>> monitorInternet() async {
    var isConnected = false;

    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) async {
      try {
        final result = await InternetAddress.lookup('google.com');
        print(result.isNotEmpty && result[0].rawAddress.isNotEmpty);
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          isConnected = true;
        }
      } on SocketException catch (_) {
        isConnected = false;
      }
      if (connectivityResult == ConnectivityResult.mobile && isConnected) {
        // si c'est la connection mobile
        _emitInternetConnected(ConnectionType.mobile);
      } else if (connectivityResult == ConnectivityResult.wifi && isConnected) {
        // si c'est le wifi
        _emitInternetConnected(ConnectionType.wifi);
      } else if (connectivityResult == ConnectivityResult.none && isConnected) {
        // s'il y'a pas de connection
        _emitInternetDisconnected();
      }
    });
  }

  /// Emit when mobile is connected to internet
  void _emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnectionConnected(connectionType: connectionType));

  /// Emit when mobile is disconnected to internet
  void _emitInternetDisconnected() => emit(InternetConnectionDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription!.cancel();
    return super.close();
  }
}
