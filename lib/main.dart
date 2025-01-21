import 'package:flutter/material.dart';
import 'package:quissapp/adminAddItems.dart';
import 'package:quissapp/examwritingpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quissapp/mainpage1.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: MainPage(),
    routes: {
      "\examwitingpage": (context) => ExamWritingPage(),
      "\adminadditems": (context) => AdminAddItems(),
    },
  ));
}
