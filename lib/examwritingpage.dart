import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quissapp/userpage.dart';

class ExamWritingPage extends StatefulWidget {
  const ExamWritingPage({super.key});

  @override
  State<ExamWritingPage> createState() => _ExamWritingPageState();
}

class _ExamWritingPageState extends State<ExamWritingPage> {
  String? topicname;

  List answers = [];

  int totalmark = 0;
  int total = 0;
  int outoff = 0;

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
  List mmmmmmm=[];

  // State to store selected answers and their correctness
  List _selectedAnswers = [];
List _correctness=[];
  void fetchDataFromFirestore() async {
    List<Map<String, dynamic>> firebasedata = [];

    print(" ===================================================================================================== fetchdatafrom firebase");
    print(_correctness);
    try {
      // Reference to the Firestore collection
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('${topicname}');

      // Get documents from the collection
      final QuerySnapshot snapshot = await usersCollection.get();

      // Convert documents into a list of maps
      final List<Map<String, dynamic>> users = snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      setState(() {
        firebasedata.addAll(users);
      });
// =====================================================================================================
//       List li = [];
//       List lii = [];
//       List<int> ls = [];
//       for (var i = 0; i < firebasedata.length; i++) {
//         li.add(firebasedata[i]['answer']);
//       }
//       for (var i = li.length - 1; i >= 0; i--) {
//         lii.add(int.parse(li[i]));
//       }
//       for (var i = 0; i < lii.length; i++) {
//         lii[i] = lii[i] - 1;
//       }

//       print(li);
//       print(lii);
//       print(_selectedAnswers);
//       print(
//           "===================================================================== Exam result");
// // for (var i = 0; i < li.length; i++) {
// //   ls.add(int.parse(_selectedAnswers[]))
// // }

//       for (var i = 0; i < li.length; i++) {
//         print("loop one add");
//         if (lii[i] == _selectedAnswers[i]) {
//           setState(() {
//             totalmark = totalmark + 1;
//             print("plus one");
//           });
//         }
//       }
for (var i = 0; i < _correctness.length; i++) {
  if (_correctness[i]=true) {
    totalmark=totalmark+1;
  }
}
      print(
          "===================================================================== Exam result");
      final l = FirebaseAuth.instance.currentUser!.email;

  if (_selectedAnswers[0]!=null) {
    //  print("NNNNNNNNNNNNOOOOOOOOOOOTTTTTTTTTeeeeeeeeeeemmmmmmmmmppppppppppppptttttttttyyyyyyyyyy");
    





        await FirebaseFirestore.instance.collection('result').add({
        "username": l,
        "totalmark": totalmark,
        "usersAnswers": _correctness,
        "correctAnswer": _selectedAnswers
      });












  }else{
    print("eeeeeeeeeeeeeeeeeeeeeemmmmmmmmmmmmmmmmmmmmmmmmppppppppppppppppppppppppttttttttttttttttttttttyyyyyyyyyyyyyyyyyyy");
  }
      print(
          "===================================================================== Exam result");
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shadowColor:totalmark>=outoff/2? Colors.green:Colors.red ,
            // title:totalmark>=outoff/2? Text('you Won!'):Text('you Got!'),
            title: Container(
              height: 250,
              width: 250,
             decoration: BoxDecoration(
               color: totalmark>=outoff/2? Colors.green:Colors.red,
               borderRadius: BorderRadius.circular(10)
             ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    totalmark>=outoff/2? Text("Congrats...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)):Text("Oops!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  totalmark>=outoff/2? Text("you won"):Text("you only got!"),
                  totalmark>=outoff/2? Text("Mark: ${totalmark}/${outoff}",style: TextStyle(fontSize: 15)):Text("Mark: ${totalmark}/${outoff}",style: TextStyle(fontSize: 15)),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: totalmark>=outoff/2? Colors.grey:Colors.grey,
                        ),
                        onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Userpage(),));
                      }, child: Text('OK')),
                      SizedBox(width: 15,)
                    ],
                  ),
                  // Text(_correctness.toString())
                ],
              ),
            )
            
          );
        },
      );

// =====================================================================================================
    } catch (e) {
      print('Error fetching data: $e');
      print(
          '::::::::::::::::::::::::::::Error in catch::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');
      print(e);
    }
    print(
        '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');
    print(firebasedata);
  }


// Future<void>d()async{
//     final CollectionReference usersCollection =
//           FirebaseFirestore.instance.collection('${topicname}');

//       // Get documents from the collection
//       final QuerySnapshot snapshot = await usersCollection.get();

//       // Convert documents into a list of maps
//       final List<Map<String, dynamic>> users = snapshot.docs.map((doc) {
//         return doc.data() as Map<String, dynamic>;
//       }).toList();

//       setState(() {
//         mmmmmmm.addAll(users);
//       });
//       print("=======================+++++++++++++++++++++++++++++++++++++++++=============================+++++++++++++++++++++=================");
//       print(mmmmmmm);
//       print("=======================+++++++++++++++++++++++++++++++++++++++++=============================+++++++++++++++++++++=================");
// }
  @override
  void initState() {
    super.initState();
    // fetchDataFromFirestore();
    _selectedAnswers = List<int?>.filled(
        _questions.length, null); // Initially, no answer is selected

    // _selectedAnswers = List<int?>.filled(.length, null); // Initially, no answer is selected

      _correctness = List<bool>.filled(_questions.length, false);   // Initially, all answers are marked incorrect
  }

  @override
  Widget build(BuildContext context) {
    topicname = ModalRoute.of(context)?.settings.arguments as String;
  //  d();

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
                  Text("${total}/${outoff}",
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
                          fetchDataFromFirestore();
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
              //   itemCount: mmmmmmm.length,
              //   itemBuilder: (context, index) {

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
              //                 'Q${index + 1}: ${mmmmmmm[index]['question']}',
              //                 style: TextStyle(
              //                     fontSize: 18, fontWeight: FontWeight.bold),
              //               ),
              //               SizedBox(height: 12),
              //               ...List.generate(
              //                 mmmmmmm[index]['options'].length,
              //                 (optionIndex) => ListTile(
              //                   title: Text(mmmmmmm[index]['options'][optionIndex]),
              //                   leading: Radio<int>(
              //                     value: optionIndex,
              //                     groupValue: _selectedAnswers[index],
              //                     onChanged: (value) {
              //                       setState(() {
              //                         _selectedAnswers[index] = value;
              //                         total = total + 1;
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
              // ==============================================================================================================================
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('${topicname.toString()}')
                    .orderBy("question")
                    .snapshots(),
                builder: (context, snapshot) {
                  print(snapshot.data!.docs.length);
                  outoff = snapshot.data!.docs.length;
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot todosnapshot =
                          snapshot.data!.docs[index];
                      return Card(margin: EdgeInsets.only(bottom: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
                          
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
                                        total = total + 1;
                                         _correctness[index] = value == int.parse(todosnapshot['answer'])-1;
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
