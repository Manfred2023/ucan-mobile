import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ucan/firebase_options.dart';
import 'package:ucan/main_shared.dart';
import 'package:ucan/utils/dependancies.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Dependencies.register(
    useMocks: false,
  );
  final firebaseApp = Firebase.app();
  FirebaseDatabase.instanceFor(
      app: firebaseApp,
      databaseURL: 'https://ucan-c283b-default-rtdb.firebaseio.com/');
  await mainShared();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
