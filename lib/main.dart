import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ucan/firebase_options.dart';
import 'package:ucan/main_shared.dart';
import 'package:ucan/utils/dependancies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Dependencies.register();
  final firebaseApp = Firebase.app();
  FirebaseDatabase.instanceFor(
      app: firebaseApp,
      databaseURL: 'https://ucan-c283b-default-rtdb.firebaseio.com/');
  await mainShared();
}
