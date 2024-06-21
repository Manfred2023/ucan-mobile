// Created by Jospin MAMBOU on 15/12/2022, 10:11
// Email websafe21@gmail.com
// Copyright (c) 2022. All rights reserved.
// Last modified 25/10/2022, 09:17

part of 'internet_connection_cubit.dart';

/// Cubit class to not if mobile have internet connexion or not
abstract class InternetConnectionState extends Equatable {
  ///
  const InternetConnectionState();
}

/// initialisation of cubit Internet Connection
class InternetConnectionInitial extends InternetConnectionState {
  @override
  List<Object> get props => [];
}

/// mobil App is connected
class InternetConnectionConnected extends InternetConnectionState {
  /// {@macro InternetConnectionConnected}
  const InternetConnectionConnected({required this.connectionType});

  /// Type de connection
  final ConnectionType connectionType;

  @override
  List<Object?> get props => [connectionType];
}

/// mobil App is disconnected
class InternetConnectionDisconnected extends InternetConnectionState {
  @override
  List<Object?> get props => [];
}
