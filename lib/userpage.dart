import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quissapp/loginpage.dart';

class Userpage extends StatefulWidget {
  const Userpage({super.key});

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Choose your Topic",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              PopupMenuButton(
                itemBuilder: (context) {
                  return [''].map(
                    (String e) {
                      return PopupMenuItem<String>(
                          child: Column(
                        children: [
                          TextButton(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Loginpage(),
                                    ));
                              },
                              child: Text('logout')),
                        ],
                      ));
                    },
                  ).toList();
                },
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 630,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurpleAccent),
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('topics')
                  .orderBy("language")
                  .snapshots(),
              builder: (context, snapshot) {
                print(snapshot.data!.docs.length);
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot todosnapshot =
                        snapshot.data!.docs[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "\examwitingpage",
                            arguments: todosnapshot['language'].toString());
                        print('selected $index');
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            // color: Colors.deepPurple.shade50,
                            gradient:  LinearGradient(colors: [
                              Colors.deepPurple.shade400,
                              Colors.purple.shade500
                            ]),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 3),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                  color: Colors.grey,
                                  blurStyle: BlurStyle.inner)
                            ]),
                        alignment: Alignment.center,
                        child: Text(
                          todosnapshot['language'].toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              // color: Colors.purple,
                              color: Colors.white,
                              letterSpacing: 1),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
