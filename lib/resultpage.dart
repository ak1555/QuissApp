import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              child: Text(
                "Result",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 550,
              width: double.infinity,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('result')
                    .orderBy("username")
                    .snapshots(),
                builder: (context, snapshot) {
                  // print(snapshot.data!.docs.length);
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot todosnapshot =
                          snapshot.data!.docs[index];

                      return Row(
                        children: [
                          Container(
                              height: 70,
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                '${index + 1}) ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                          Expanded(
                            child: Container(
                              height: 70,
                              // width: double.infinity,
                              margin: EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    todosnapshot['username'].toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        letterSpacing: 1),
                                  ),
                                  Text(
                                    todosnapshot["usersAnswers"].toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
