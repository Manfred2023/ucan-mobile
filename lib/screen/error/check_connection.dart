// Created by Jospin MAMBOU on 23/05/2023, 17:09
// Email websafe21@gmail.com
// Copyright (c) 2023, All rights reserved
// Last modified 23/05/2023, 17:09

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/config/colors.dart';
import '../../app/internet_connection/cubit/internet_connection_cubit.dart';

class CheckConnection extends StatefulWidget {
  const CheckConnection({Key? key}) : super(key: key);

  @override
  State<CheckConnection> createState() => _CheckConnectionState();
}

class _CheckConnectionState extends State<CheckConnection> {
  bool? _hasInternet;
  bool? _isConnectToServerPrimary;
  //bool? _isConnectToServerSecondary;
  bool? _isConnectToServerPayment;
  bool? _isConnectToServerOperation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<InternetConnectionCubit, InternetConnectionState>(
        listener: (context, state) {
          if (state is InternetConnectionConnected) {}
        },
        child: Scaffold(
          backgroundColor: ColorsApp.secondary,
          body: Container(),
          bottomNavigationBar: Container(
            color: ColorsApp.secondary,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
