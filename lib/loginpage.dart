import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quissapp/adminpage.dart';
import 'package:quissapp/signup.dart';
import 'package:quissapp/userpage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController usrname = TextEditingController();
  TextEditingController pswd = TextEditingController();

  Future<void> registerUser() async {
    try {
      // Create user
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: usrname.text.trim(),
        password: pswd.text.trim(),
      );

      // Save user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'username': usrname.text.trim(),
        'role': "user",
      });
      // getUserRole();
      checkUserRole();
    } catch (e) {
      print(
          "================================================================================error");
      print('Error registering user: $e');
    }
  }

  Future<String?> getUserRole() async {
    try {
      // Get the current user
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // Fetch user document from Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .get();

        // Check if the role field exists
        if (userDoc.exists && userDoc['role'] != null) {
          return userDoc['role'] as String;
        }
      }
      return null; // Role not found
    } catch (e) {
      print('Error fetching user role: $e');
      return null;
    }
  }

  void checkUserRole() async {
    String? role = await getUserRole();

    if (role == 'admin') {
      print(
          "================================================================================answer");
      print('User is an admin');
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Adminpage(),
      ));
    } else if (role == 'user') {
      print(
          "================================================================================answer");
      print('User is a regular user');
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Userpage(),
      ));
    } else {
      print(
          "================================================================================answer");
      print('Role not defined or user not found');
    }
  }

  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usrname.text.trim(), password: pswd.text.trim());

      checkUserRole();
    } catch (e) {
      print(
          "================================================================================error");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurple.shade100,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 1,
              ),
              Text("Login",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,letterSpacing: 1.5),),

              Text("Welcome to E-Learning platform",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,letterSpacing: 1),),
            
              SizedBox(
                height: 15,
              ),
              Container(
                height: 85,
                width: double.infinity,
                child: Expanded(
                    child: TextField(
                  controller: usrname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                    fillColor: Colors.white,filled: true,
                    labelText: 'username',
                  ),
                )),
              ),
              Container(
                height: 85,
                width: double.infinity,
                child:
                    // Column(
                    //   children: [
                    Expanded(
                        child: TextField(
                  controller: pswd,
                  decoration: InputDecoration(
                    fillColor: Colors.white,filled: true,
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)), labelText: 'password'),
                )),
                // Row(children: [
                //   CupertinoButton(sizeStyle: CupertinoButtonSize.small,
                //     child: Text("forgot password",style: TextStyle(fontSize: 14),), onPressed: () {

                //   },)
                // ],)
                //   ],
                // ),
              ),
              SizedBox(
                height: 15,
              ),
              CupertinoButton(
                  // style: TextButton.styleFrom(backgroundColor: Colors.green),
                  // color: Colors.green,
                  color: Colors.deepPurple.shade300,
                  padding:
                      EdgeInsets.only(left: 75, right: 75, top: 15, bottom: 15),
                  onPressed: () {
                    // registerUser();
                    login();
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 19,letterSpacing: 1,
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text("Don't have an account yet?"),
                  CupertinoButton(
                    sizeStyle: CupertinoButtonSize.small,
                    child: Text('Signup'), onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                  },),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
