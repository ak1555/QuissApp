import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController usrname = TextEditingController();
  TextEditingController pswd = TextEditingController();
  void login() async {
  try {
      final data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: usrname.text.trim(), password: pswd.text.trim());
        print('logined');
        // add users to user collection
  } catch (e) {
    print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
      print(e);
    print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
  
  }

  //  User? user = FirebaseAuth.instance.currentUser;

  // if (user != null) {
  //   await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
  //     'email': user.email,
  //     'role': role,
  //   });
  // }
  }

  Future<void> addUserToFirestore() async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'email': user.email,
      'role': 'user',
    });
  }
}
// Future<String?> getUserRole() async {
//   User? user = FirebaseAuth.instance.currentUser;

//   if (user != null) {
//     DocumentSnapshot doc = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(user.uid)
//         .get();

//     if (doc.exists) {
//       return doc['role']; // Returns 'user' or 'admin'
//     }
//   }
//   return null;
// }
// Future<String?> getCustomClaimsRole() async {
//   User? user = FirebaseAuth.instance.currentUser;

//   if (user != null) {
//     IdTokenResult idTokenResult = await user.getIdTokenResult();
//     return idTokenResult.claims?['role'] as String?; // Returns 'admin' or 'user'
//   }
//   return null;
// }

void navigateBasedOnRole(String role) {
  if (role == 'admin') {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminScreen()));
  } else if (role == 'user') {
    Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen()));
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              // Container(
              //   height: 100,
              //   width: double.infinity,
              //   child:
              Expanded(
                  child: TextField(
                controller: usrname,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'username'),
              )),
              // ),

              //  Container(
              //   height: 100,
              //   width: double.infinity,
              // child:
              Expanded(
                  child: TextField(
                controller: pswd,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'password'),
              )),
              // ),
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    login();
                  },
                  child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
