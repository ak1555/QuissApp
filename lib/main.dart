import 'package:flutter/material.dart';
import 'package:quissapp/adminpage.dart';
import 'package:quissapp/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quissapp/signup.dart';
import 'firebase_options.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MaterialApp(
      home: Adminpage(),
    )
  );
}