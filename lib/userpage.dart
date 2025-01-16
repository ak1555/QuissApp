import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quissapp/examwritingpage.dart';

class Userpage extends StatefulWidget {
  const Userpage({super.key});

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  List ls = ['java', 'python'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: ListView(
        children: [
          Text(
            "Choose your Topic",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          Container(
            height: 550,
            width: double.infinity,
            padding: EdgeInsets.only(left: 10,right: 10),
            // child: ListView.builder(
            //   itemCount: ls.length,
            //   itemBuilder: (context, index) {
            //     return GestureDetector(
            //       onTap: () {
            //         Navigator.push(context, MaterialPageRoute(builder: (context) => ExamWritingPage(),));
            //         print('selected $index');
            //       },
            //       child: Container(
            //         height: 70,
            //         width: double.infinity,
            //         margin: EdgeInsets.only(top: 15),
            //         decoration: BoxDecoration(
            //           border: Border.all(),
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //         alignment: Alignment.center,
            //         child: Text(
            //           ls[index].toString(),
            //           style: TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.purple,
            //               letterSpacing: 1),
            //         ),
            //       ),
            //     );
            //   },
            // ),


            // child: GridView.builder(
            //   itemCount: ls.length,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     crossAxisSpacing: 10,
            //     mainAxisSpacing: 10,
            //     childAspectRatio: 2.3 / 3,
            //   ),
            //   itemBuilder: (context, index) {
            //     return GestureDetector(
            //       onTap: () {
            //         // Navigator.push(
            //         //     context,
            //         //     MaterialPageRoute(
            //         //       builder: (context) => ExamWritingPage(),
            //         //     ));
            //         Navigator.pushNamed(context, "\examwitingpage",arguments: index);
            //         print('selected $index');
            //       },
            //       child: Container(
            //         height: 70,
            //         width: double.infinity,
            //         margin: EdgeInsets.only(top: 15),
            //         decoration: BoxDecoration(
            //             border: Border.all(),
            //             color: Colors.grey.shade50,
            //             borderRadius: BorderRadius.circular(20),
            //             boxShadow: [
            //               BoxShadow(
            //                   offset: Offset(0, 3),
            //                   blurRadius: 3,
            //                   spreadRadius: 2,
            //                   color: Colors.grey,
            //                   blurStyle: BlurStyle.inner)
            //             ]),
            //         alignment: Alignment.center,
            //         child: Text(
            //           ls[index].toString(),
            //           style: TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.purple,
            //               letterSpacing: 1),
            //         ),
            //       ),
            //     );
            //   },
            // ),
            child:                 StreamBuilder(
          stream: FirebaseFirestore.instance.collection('topics').orderBy("language").snapshots(),
          builder: (context, snapshot) {
            print(snapshot.data!.docs.length);
            // return ListView.builder(
            //   itemCount: snapshot.data!.docs.length,
            //   itemBuilder: (context, index) {
            //     final DocumentSnapshot todosnapshot =
            //         snapshot.data!.docs[index];

            //     return ListTile(
            //       title: Text(todosnapshot["task"].toString()),
            //       trailing: IconButton(onPressed: () {
            //         //  deletetodo(todosnapshot.id);
            //          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Deleted")));
            //       }, icon: Icon(Icons.delete_outline)),
            //       onTap: () {
            //         print(todosnapshot.id);
            //         List ls=[todosnapshot.id,
            //         todosnapshot["task"].toString()
            //         ];
            //         Navigator.pushNamed(context, "update",arguments:ls);
            //       },
            //     );
            //   },
            // );
            return GridView.builder(
              itemCount: ls.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.3 / 3,
              ),
              itemBuilder: (context, index) {
                final DocumentSnapshot todosnapshot =
                    snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ExamWritingPage(),
                    //     ));
                    Navigator.pushNamed(context, "\examwitingpage",arguments:todosnapshot['language'].toString());
                    print('selected $index');
                  },
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 3,
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
                          color: Colors.purple,
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
