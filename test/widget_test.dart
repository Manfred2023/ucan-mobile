// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ucan/app/app.dart';
import 'package:ucan/data/ucan/service/remote/contact_auth.dart';
import 'package:ucan/firebase_options.dart';
 
final ContactAuthService _auth = ContactAuthService();
void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    final String email = "moukatemanfred@gmail.com";
    final String passcode = "passcode";

    final user = await _auth.SingupWithEmail(email, passcode); 
  
}
