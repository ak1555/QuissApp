import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
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
                    // sudo apt install nodejs sudo
                    child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      suffixIcon: Icon(Icons.person)),
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
                  controller: password,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.remove_red_eye)),
                )),
                // Row(children: [
                //   CupertinoButton(sizeStyle: CupertinoButtonSize.small,
                //     child: Text("forgot password",style: TextStyle(fontSize: 14),), onPressed: () {

                //   },)
                // ],)
                //   ],
                // ),
              ),
              Container(
                height: 85,
                width: double.infinity,
                child:
                    // Column(
                    //   children: [
                    Expanded(
                        child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Conform-password',
                      suffixIcon: Icon(Icons.remove_red_eye)),
                )),
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
                    // login();
                  },
                  child: Text(
                    'Register & Signup',
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
