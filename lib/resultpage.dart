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
              height: 610,
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
                                    fontWeight: FontWeight.w400, fontSize: 20),
                              )),
                          Expanded(
                            child: Container(
                              height: 70,
                              margin: EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: todosnapshot["totalmark"] >=
                                            todosnapshot["outoff"] / 2
                                        ? Colors.green
                                        : Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    todosnapshot['username'].toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        letterSpacing: 1),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        todosnapshot["topic"].toString(),
                                        style: TextStyle(
                                            color: Colors.blue.shade900),
                                      ),
                                      Spacer(),
                                      Text(
                                        "score: ${todosnapshot["totalmark"].toString()}/${todosnapshot["outoff"].toString()}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                    ],
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
