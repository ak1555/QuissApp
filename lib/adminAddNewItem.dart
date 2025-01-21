import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminAddNewItem extends StatefulWidget {
  const AdminAddNewItem({super.key});

  @override
  State<AdminAddNewItem> createState() => _AdminAddNewItemState();
}

class _AdminAddNewItemState extends State<AdminAddNewItem> {
  TextEditingController NewTopic = TextEditingController();
  TextEditingController Question = TextEditingController();
  TextEditingController Option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController option3 = TextEditingController();
  TextEditingController option4 = TextEditingController();
  TextEditingController answer = TextEditingController();
  List ls = [];
  Map mp = {};

  void addtoList() async {
    List li = [Option1.text, option2.text, option3.text, option4.text];
    mp = {"question": Question.text, "options": li, "answer": answer.text};
    setState(() {
      ls.add(mp);
    });
    try {
      await FirebaseFirestore.instance.collection('${NewTopic.text}').add(
          {"question": Question.text, "options": li, "answer": answer.text});
    } catch (e) {
      print(e);
    }
    Question.clear();
    Option1.clear();
    option2.clear();
    option3.clear();
    option4.clear();
    answer.clear();
  }

  void getdatas() async {}

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Topic',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                CupertinoButton(
                  child: Text('Save Updates'),
                  onPressed: () async {
                    // saveupdates();
                    if (NewTopic.text != '') {
                      try {
                        await FirebaseFirestore.instance
                            .collection('topics')
                            .add({"language": NewTopic.text});
                        Navigator.pop(context);
                      } catch (e) {
                        print(e);
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("you must enter a topic"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("ok"))
                            ],
                          );
                        },
                      );
                    }
                  },
                )
              ],
            ),
            Divider(),
            Container(
              height: 55,
              width: double.infinity,
              padding: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey.shade700),
                  borderRadius: BorderRadius.circular(5)),
              child: Expanded(
                  child: TextField(
                controller: NewTopic,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Enter New Topic Name"),
              )),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Add Questions',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
            Container(
              height: 210,
              width: double.infinity,
              padding: EdgeInsets.only(left: 1.5, right: 1.5),
              decoration: BoxDecoration(
                  border: Border.all(
                      )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(height: 3,),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: Expanded(
                        child: TextField(
                      controller: Question,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide()),
                          labelText: "Question"),
                    )),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          child: Expanded(
                              child: TextField(
                            controller: Option1,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "option1"),
                          )),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Expanded(
                              child: TextField(
                            controller: option2,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "option2"),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          child: Expanded(
                              child: TextField(
                            controller: option3,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "option3"),
                          )),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Expanded(
                              child: TextField(
                            controller: option4,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "option4"),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 135,
                        height: 40,
                        child: Expanded(
                            child: TextField(
                          controller: answer,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Correct option"),
                        )),
                      ),
                      CupertinoButton(
                        sizeStyle: CupertinoButtonSize.small,
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        child: Text(
                          'Add',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          addtoList();
                        },
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Questions',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            //  =================================
            Container(
                height: 550,
                width: double.infinity,
                child: NewTopic.text.isNotEmpty
                    ? StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('${NewTopic.text}')
                            .orderBy("question")
                            .snapshots(),
                        builder: (context, snapshot) {
                          print(snapshot.data!.docs.length);
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot todosnapshot =
                                  snapshot.data!.docs[index];

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // "2). who developed flutter?",
                                    "${index + 1}). ${todosnapshot["question"].toString()}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      height: 100,
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: double.infinity,
                                              width: 150,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                      child: Container(
                                                    width: double.infinity,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.grey)),
                                                    child: Text(
                                                      todosnapshot["options"][0]
                                                          .toString(),
                                                    ),
                                                  )),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                    width: double.infinity,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.grey)),
                                                    child: Text(
                                                        todosnapshot["options"]
                                                                [1]
                                                            .toString()),
                                                  ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: double.infinity,
                                              width: 150,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                      child: Container(
                                                    width: double.infinity,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.grey)),
                                                    child: Text(
                                                        todosnapshot["options"]
                                                                [2]
                                                            .toString()),
                                                  )),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                    width: double.infinity,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.grey)),
                                                    child: Text(
                                                        todosnapshot["options"]
                                                                [3]
                                                            .toString()),
                                                  ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              );
                            },
                          );
                        },
                      )
                    : SizedBox(
                        height: 1,
                      )

                // child: ListView.builder(
                //   itemCount: ls.length,
                //   itemBuilder: (context, index) {
                //   return Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         // "2). who developed flutter?",
                //         "${index+1}). ${ls[index]["question"].toString()}",
                //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                //       ),
                //       SizedBox(
                //         height: 5,
                //       ),
                //       Container(
                //           height: 100,
                //           width: double.infinity,
                //           child: Row(
                //             children: [
                //               Expanded(
                //                 child: Container(
                //                   height: double.infinity,
                //                   width: 150,
                //                   child: Column(
                //                     children: [
                //                       Expanded(
                //                           child: Container(
                //                         width: double.infinity,
                //                         alignment: Alignment.center,
                //                         decoration: BoxDecoration(
                //                             border: Border.all(color: Colors.grey)),
                //                         child: Text( ls[index]["options"][0].toString(),),
                //                       )),
                //                       SizedBox(
                //                         height: 5,
                //                       ),
                //                       Expanded(
                //                           child: Container(
                //                         width: double.infinity,
                //                         alignment: Alignment.center,
                //                         decoration: BoxDecoration(
                //                             border: Border.all(color: Colors.grey)),
                //                         child: Text(ls[index]["options"][1].toString()),
                //                       ))
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //               SizedBox(
                //                 width: 5,
                //               ),
                //               Expanded(
                //                 child: Container(
                //                   height: double.infinity,
                //                   width: 150,
                //                   child: Column(
                //                     children: [
                //                       Expanded(
                //                           child: Container(
                //                         width: double.infinity,
                //                         alignment: Alignment.center,
                //                         decoration: BoxDecoration(
                //                             border: Border.all(color: Colors.grey)),
                //                         child: Text(ls[index]["options"][2].toString()),
                //                       )),
                //                       SizedBox(
                //                         height: 5,
                //                       ),
                //                       Expanded(
                //                           child: Container(
                //                         width: double.infinity,
                //                         alignment: Alignment.center,
                //                         decoration: BoxDecoration(
                //                             border: Border.all(color: Colors.grey)),
                //                         child: Text(ls[index]["options"][3].toString()),
                //                       ))
                //                     ],
                //                   ),
                //                 ),
                //               )
                //             ],
                //           )),
                //     ],
                //   );
                // },),
                ),
            //  =================================
            // SizedBox(
            //   height: 30,
            // ),
          ],
        ),
      ),
    );
  }
}
