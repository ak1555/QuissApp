import 'package:flutter/material.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  height: 130,
                  width: 300,
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.shade200),
                      ),
                      Text("ADMIN")
                    ],
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: 100,
                  // child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // children: [
                    child:   IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                    // ],
                  // ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
