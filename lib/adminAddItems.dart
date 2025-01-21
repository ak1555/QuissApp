import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminAddItems extends StatefulWidget {
  const AdminAddItems({super.key});

  @override
  State<AdminAddItems> createState() => _AdminAddItemsState();
}

class _AdminAddItemsState extends State<AdminAddItems> {
  TextEditingController Question = TextEditingController();
  TextEditingController Option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController option3 = TextEditingController();
  TextEditingController option4 = TextEditingController();
  TextEditingController answer = TextEditingController();
  String? languagename;
  void toadd() async {
    List li = [Option1.text, option2.text, option3.text, option4.text];

    await FirebaseFirestore.instance
        .collection('${languagename}')
        .add({"question": Question.text, "options": li, "answer": answer.text});
    Question.clear();
    Option1.clear();
    option2.clear();
    option3.clear();
    option4.clear();
    answer.clear();
  }

  @override
  Widget build(BuildContext context) {
    languagename = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: ListView(
          children: [
            Center(
              child: Text(
                languagename.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Questions',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                CupertinoButton(
                  child: Text('Save Updates'),
                  onPressed: () {},
                )
              ],
            ),
            Divider(),
            Container(
              height: 205,
              width: double.infinity,
              padding: EdgeInsets.only(left: 1.5, right: 1.5),
              decoration: BoxDecoration(
                  border: Border.all(
                      // color: Colors.purple.shade600,width: 2
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
                          toadd();
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
              '${languagename} Questions',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 490,
              width: double.infinity,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('${languagename.toString()}')
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
                            "${index + 1}). ${todosnapshot['question'].toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
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
                                                    color: Colors.grey)),
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
                                                    color: Colors.grey)),
                                            child: Text(
                                              todosnapshot["options"][1]
                                                  .toString(),
                                            ),
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
                                                    color: Colors.grey)),
                                            child: Text(
                                              todosnapshot["options"][2]
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
                                                    color: Colors.grey)),
                                            child: Text(
                                              todosnapshot["options"][3]
                                                  .toString(),
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 40,
                            width: 93,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'Answer: ${todosnapshot["answer"].toString()}',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
