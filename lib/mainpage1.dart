import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quissapp/loginpage.dart';
import 'package:quissapp/mainpage2.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream:FirebaseAuth.instance.authStateChanges() , builder: (context, snapshot) {
        print(snapshot.hasData);
        return snapshot.hasData?Mainpage2():Loginpage();
      },),
    );
  }
}