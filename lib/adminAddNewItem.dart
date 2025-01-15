import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminAddNewItem extends StatefulWidget {
  const AdminAddNewItem({super.key});

  @override
  State<AdminAddNewItem> createState() => _AdminAddNewItemState();
}

class _AdminAddNewItemState extends State<AdminAddNewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: ListView(
          children: [
            // Center(
            //   child: Text(
            //     'Flutter',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            //   ),
            // ),
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
                  onPressed: () {},
                )
              ],
            ),
            Divider(),
            Container(
              height: 55,
              width: double.infinity,
              padding: EdgeInsets.only(left: 5,right: 5),
              decoration: BoxDecoration(
                border: Border.all(width: 2,color: Colors.grey.shade800),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Expanded(child: TextField(
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(  borderSide: BorderSide(style: BorderStyle.solid,color: Colors.black,width: 2,strokeAlign: 2)),
                          border: InputBorder.none,
                          labelText: "Enter New Topic Name"),
                    )),
            ),
            SizedBox(height: 15,),
               Text(
                  'Add Questions',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
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
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "option4"),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CupertinoButton(
                        sizeStyle: CupertinoButtonSize.small,
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        child: Text(
                          'Add',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1). who developed flutter?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                                      border: Border.all(color: Colors.grey)),
                                  child: Text('Facebook'),
                                )),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                    child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  child: Text('Google'),
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
                                      border: Border.all(color: Colors.grey)),
                                  child: Text('Youtube'),
                                )),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                    child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  child: Text('Amazon'),
                                ))
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2). who developed flutter?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                                      border: Border.all(color: Colors.grey)),
                                  child: Text('Facebook'),
                                )),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                    child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  child: Text('Google'),
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
                                      border: Border.all(color: Colors.grey)),
                                  child: Text('Youtube'),
                                )),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                    child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  child: Text('Amazon'),
                                ))
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
