import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quissapp/adminAddNewItem.dart';
import 'package:quissapp/resultpage.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  TextEditingController addnewfield = TextEditingController();
  List ls = ['flutter', 'python'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: ListView(children: [
              Container(
                height: 130,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blue.shade900, width: .5),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey.shade200),
                          child: Icon(
                            Icons.person,
                            color: Colors.grey.shade700,
                            size: 60,
                          ),
                        ),
                        Text(
                          "ADMIN",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        )
                      ],
                    ),
                    // ====================================
                    PopupMenuButton(
                      itemBuilder: (context) {
                        return [''].map(
                          (String e) {
                            return PopupMenuItem<String>(
                                child: Column(
                              children: [
                                // TextButton(
                                //     onPressed: () {}, child: Text('Add Admin')),
                                TextButton(
                                    onPressed: () async {
                                      await FirebaseAuth.instance.signOut();
                                      Navigator.popUntil(
                                        context,
                                        (route) => route.isFirst,
                                      );
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
              ),
              // =======================================================================================================
              SizedBox(
                height: 15,
              ),
              Container(
                height: 65,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        height: 65,
                        width: double.infinity,
                        margin: EdgeInsets.only(right: 100),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(75),
                            gradient: LinearGradient(colors: [
                              Colors.deepPurple.shade400,
                              Colors.purple.shade500
                            ])),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResultPage(),
                                  ));
                            },
                            child: Text(
                              'Results',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminAddNewItem(),
                            ));
                      },
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(100),
                            gradient: LinearGradient(colors: [
                              Colors.deepPurple.shade400,
                              Colors.deepPurple.shade400
                            ])),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.add,
                          weight: 25,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // +++==================================================================================================
              Container(
                height: 550,
                width: double.infinity,
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
                            Navigator.pushNamed(context, "\adminadditems",
                                arguments: todosnapshot['language'].toString());
                          },
                          child: Container(
                            height: 75,
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blue.shade900, width: 1.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              todosnapshot['language'].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  letterSpacing: 1),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ])));
  }
}
