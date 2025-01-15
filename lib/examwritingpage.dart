import 'package:flutter/material.dart';

class ExamWritingPage extends StatefulWidget {
  const ExamWritingPage({super.key});

  @override
  State<ExamWritingPage> createState() => _ExamWritingPageState();
}

class _ExamWritingPageState extends State<ExamWritingPage> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'who developed flutter?',
      'options': ['google', 'youtube', 'amazon', 'netflix'],
      'answer': 0, // Index of the correct option
    },
    {
      'question': 'What is 2 + 2?',
      'options': ['3', '4', '5', '6'],
      'answer': 1,
    },
  ];

  // State to store selected answers and their correctness
  List<int?> _selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    _selectedAnswers = List<int?>.filled(
        _questions.length, null); // Initially, no answer is selected
    //   _correctness = List<bool>.filled(_questions.length, false);   // Initially, all answers are marked incorrect
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter",
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
                        onPressed: () {
                          print('textbutton');
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
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  final question = _questions[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Q${index + 1}: ${question['question']}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 12),
                            ...List.generate(
                              question['options'].length,
                              (optionIndex) => ListTile(
                                title: Text(question['options'][optionIndex]),
                                leading: Radio<int>(
                                  value: optionIndex,
                                  groupValue: _selectedAnswers[index],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedAnswers[index] = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
