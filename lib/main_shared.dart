// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ucan/app/app.dart';
import 'package:ucan/app/config/colors.dart'; 

Future<void> mainShared() async{

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: true,
      statusBarColor: ColorsApp.secondary,
      systemNavigationBarColor: ColorsApp.secondary,
    ),
  );
   runApp(MyApp(
    //connectivity: Connectivity(),
  ));
  
  
}