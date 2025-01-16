import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ExamWritingPage extends StatefulWidget {
  const ExamWritingPage({super.key});

  @override
  State<ExamWritingPage> createState() => _ExamWritingPageState();
}

class _ExamWritingPageState extends State<ExamWritingPage> {
  String? topicname;

  List answers = [];

  // final List<Map<String, dynamic>> _questions = [];
  List _questions = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
  ];

  // State to store selected answers and their correctness
  List<int?> _selectedAnswers = [];

  // void fetchDataFromFirestore() async {
  //   print("fetchdatafrom firebase");
  //   print(topicname);
  //   try {
  //     // Reference to the Firestore collection
  //     final CollectionReference usersCollection =
  //         FirebaseFirestore.instance.collection('${topicname}');

  //     // Get documents from the collection
  //     final QuerySnapshot snapshot = await usersCollection.get();

  //     // Convert documents into a list of maps
  //     final List<Map<String, dynamic>> users = snapshot.docs.map((doc) {
  //       return doc.data() as Map<String, dynamic>;
  //     }).toList();

  //     setState(() {
  //       _questions.addAll(users);
  //     });
  //   } catch (e) {
  //     print('Error fetching data: $e');
  //     print('::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');
  //     print(topicname);
  //   }
  //   print(_questions);
  // }

  void s() {
    print(_selectedAnswers);
  }

  @override
  void initState() {
    super.initState();
    // fetchDataFromFirestore();
    _selectedAnswers = List<int?>.filled(
        _questions.length, null); // Initially, no answer is selected

    // _selectedAnswers = List<int?>.filled(.length, null); // Initially, no answer is selected

    //   _correctness = List<bool>.filled(_questions.length, false);   // Initially, all answers are marked incorrect
  }

  @override
  Widget build(BuildContext context) {
    topicname = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // "Flutter",
          topicname.toString(),
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 22),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("10/10",
                      // topicname.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1)),
                  Container(
                    height: 45,
                    width: 95,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(75),
                        gradient: LinearGradient(colors: [
                          Colors.deepPurple.shade300,
                          Colors.purple.shade400
                        ])),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                        onPressed: () async {
                          print(_selectedAnswers);

                          // final currentuser =
                          //     await FirebaseAuth.instance.currentUser;
                          // DocumentSnapshot userDoc = await FirebaseFirestore
                          //     .instance
                          //     .collection('users')
                          //     .doc(currentuser!.uid)
                          //     .get();

                          // print(userDoc.get('username'));

                          // final name = userDoc.get('username');
                        },
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontSize: 15),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Divider(),
            Container(
              height: 600,
              // child: ListView.builder(
              //   itemCount: _questions.length,
              //   itemBuilder: (context, index) {
              //     final question = _questions[index];
              //     return Padding(
              //       padding: const EdgeInsets.all(16.0),
              //       child: Card(
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(12)),
              //         elevation: 4,
              //         child: Padding(
              //           padding: const EdgeInsets.all(16.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 'Q${index + 1}: ${question['question']}',
              //                 style: TextStyle(
              //                     fontSize: 18, fontWeight: FontWeight.bold),
              //               ),
              //               SizedBox(height: 12),
              //               ...List.generate(
              //                 question['options'].length,
              //                 (optionIndex) => ListTile(
              //                   title: Text(question['options'][optionIndex]),
              //                   leading: Radio<int>(
              //                     value: optionIndex,
              //                     groupValue: _selectedAnswers[index],
              //                     onChanged: (value) {
              //                       setState(() {
              //                         _selectedAnswers[index] = value;
              //                       });
              //                     },
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // ),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('${topicname.toString()}')
                    .orderBy("question")
                    .snapshots(),
                builder: (context, snapshot) {
                  print(snapshot.data!.docs.length);
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot todosnapshot =
                          snapshot.data!.docs[index];
                      // print("==============================================================");
                      // print(todosnapshot['question']);

                      // return ListTile(
                      //   title: Text(todosnapshot["task"].toString()),
                      //   trailing: IconButton(onPressed: () {
                      //     //  deletetodo(todosnapshot.id);
                      //      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Deleted")));
                      //   }, icon: Icon(Icons.delete_outline)),
                      //   onTap: () {
                      //     print(todosnapshot.id);
                      //     List ls=[todosnapshot.id,
                      //     todosnapshot["task"].toString()
                      //     ];
                      //     Navigator.pushNamed(context, "update",arguments:ls);
                      //   },
                      // );

                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Q${index + 1}: ${todosnapshot['question']}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 12),
                              ...List.generate(todosnapshot['options'].length,
                                  (optionIndex) {
                                return ListTile(
                                  title: Text(
                                      todosnapshot['options'][optionIndex]),
                                  leading: Radio<int>(
                                    value: optionIndex,
                                    groupValue: _selectedAnswers[index],
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedAnswers[index] = value;
                                      });
                                    },
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
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
