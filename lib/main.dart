import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pertemuan7/UI/login_ui.dart';
import 'package:pertemuan7/firebase_options.dart';

void main(){
WidgetsFlutterBinding.ensureInitialized();
Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform
);

  runApp(const MaterialApp(
    title: 'Login Via Google',
    home: LoginUI(),
  ));
}