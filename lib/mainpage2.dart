import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quissapp/adminpage.dart';
import 'package:quissapp/userpage.dart';

class Mainpage2 extends StatefulWidget {
  const Mainpage2({super.key});

  @override
  State<Mainpage2> createState() => _Mainpage2State();
}

class _Mainpage2State extends State<Mainpage2> {
 
 


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




@override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUserRole();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
body: Center(child: CircularProgressIndicator()),
    );
  }
}