import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ucan/firebase_options.dart';
import 'package:ucan/main_shared.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await mainShared();
}
