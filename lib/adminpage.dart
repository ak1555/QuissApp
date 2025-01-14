import 'package:flutter/material.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  List ls=['flutter','python'];
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
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey.shade200),
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
                                TextButton(
                                    onPressed: () {}, child: Text('Add Admin')),
                                TextButton(
                                    onPressed: () {}, child: Text('logout')),
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
                      flex: 5,
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
                              print('textbutton');
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
                    Expanded(
                      flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        // ===== + 
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0),
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(colors: [Colors.deepPurple.shade400,Colors.deepPurple.shade400])
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.add,weight: 25,size: 35,color: Colors.white,),
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
                child: ListView.builder(
                  itemCount: ls.length,
                  itemBuilder: (context, index) {
                  return Container(
                    height: 90,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                      Colors.deepPurpleAccent.shade400,
                      Colors.purple.shade200,
                      ])
                    ),
                    alignment: Alignment.center,
                    child: Text(ls[index].toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                  );
                },),
              )
            ])));
  }
}
