import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quissapp/userpage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Cpassword = TextEditingController();

  Future<void> registerUser() async {
    if (password.text == Cpassword.text) {
      try {
        // Create user
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: username.text.trim(),
          password: password.text.trim(),
        );

        // Save user data in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': username.text.trim(),
          'role': "user",
        });
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Userpage(),
            ));
      } catch (e) {
        print(
            "================================================================================error");
        print('Error registering user: $e');
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('missmatch password'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Register",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 85,
                width: double.infinity,
                child: Expanded(
                    child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      labelText: 'Username',
                      suffixIcon: Icon(Icons.person)),
                )),
              ),
              Container(
                height: 85,
                width: double.infinity,
                child: Expanded(
                    child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.remove_red_eye)),
                )),
              ),
              Container(
                height: 85,
                width: double.infinity,
                child: Expanded(
                    child: TextField(
                  controller: Cpassword,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      labelText: 'Conform-password',
                      suffixIcon: Icon(Icons.remove_red_eye)),
                )),
              ),
              SizedBox(
                height: 15,
              ),
              CupertinoButton(
                  color: Colors.deepPurple.shade300,
                  onPressed: () {
                    registerUser();
                  },
                  child: Text(
                    'Register & Signup',
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Text("terms and privacy")
            ],
          ),
        ),
      ),
    );
  }
}
