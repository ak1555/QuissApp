import 'package:flutter/material.dart';

class AdminAddItems extends StatefulWidget {
  const AdminAddItems({super.key});

  @override
  State<AdminAddItems> createState() => _AdminAddItemsState();
}

class _AdminAddItemsState extends State<AdminAddItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: ListView(
          children: [
            Text(
              'Flutter',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all()),
            ),
            SizedBox(height: 25,),
            Text("1). who developed flutter?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 5,),
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
                              decoration: BoxDecoration(border: Border.all()),
                              child: Text('Facebook'),
                            )),
                            SizedBox(height: 5,),
                            Expanded(
                                child: Container(
                                  width: double.infinity,
                                   alignment: Alignment.center,
                              decoration: BoxDecoration(border: Border.all()),
                              child: Text('Google'),
                            ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
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
                              decoration: BoxDecoration(border: Border.all()),
                              child: Text('Youtube'),
                            )),
                            SizedBox(height: 5,),
                            Expanded(
                                child: Container(
                                  width: double.infinity,
                                   alignment: Alignment.center,
                              decoration: BoxDecoration(border: Border.all()),
                              child: Text('Amazon'),
                            ))
                          ],
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
