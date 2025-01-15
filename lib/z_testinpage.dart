// import 'package:flutter/material.dart';

// // void main() => runApp(QuizApp());

// // class QuizApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: QuizScreen(),
// //       debugShowCheckedModeBanner: false,
// //     );
// //   }
// // }

// class QuizScreen extends StatefulWidget {
//   @override
//   _QuizScreenState createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   final List<Map<String, dynamic>> _questions = [
//     {
//       'question': 'What is the capital of France?',
//       'options': ['Paris', 'Berlin', 'Madrid', 'Rome'],
//       'answer': 0, // Index of the correct option
//     },
//     {
//       'question': 'What is 2 + 2?',
//       'options': ['3', '4', '5', '6'],
//       'answer': 1,
//     },
//     {
//       'question': 'Which is the largest planet?',
//       'options': ['Earth', 'Mars', 'Jupiter', 'Venus'],
//       'answer': 2,
//     },
//   ];

//   // State to store selected answers and their correctness
//   List<int?> _selectedAnswers = [];
//   List<bool> _correctness = [];

//   @override
//   void initState() {
//     super.initState();
//     _selectedAnswers = List<int?>.filled(_questions.length, null); // Initially, no answer is selected
//     _correctness = List<bool>.filled(_questions.length, false);   // Initially, all answers are marked incorrect
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quiz App'),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: ListView.builder(
//         itemCount: _questions.length,
//         itemBuilder: (context, index) {
//           final question = _questions[index];
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Q${index + 1}: ${question['question']}',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 12),
//                     ...List.generate(
//                       question['options'].length,
//                       (optionIndex) => ListTile(
//                         title: Text(question['options'][optionIndex]),
//                         leading: Radio<int>(
//                           value: optionIndex,
//                           groupValue: _selectedAnswers[index],
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedAnswers[index] = value;
//                               _correctness[index] = value == question['answer'];
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Is your answer correct?',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         Checkbox(
//                           value: _selectedAnswers[index] != null && _correctness[index],
//                           onChanged: null, // Checkbox is controlled by Radio selection
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }











import 'package:flutter/material.dart';

// void main() => runApp(QuizApp());

// class QuizApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: QuizScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'Berlin', 'Madrid', 'Rome'],
      'answer': 0,
    },
    {
      'question': 'What is 2 + 2?',
      'options': ['3', '4', '5', '6'],
      'answer': 1,
    },
    {
      'question': 'Which is the largest planet?',
      'options': ['Earth', 'Mars', 'Jupiter', 'Venus'],
      'answer': 2,
    },
  ];

  List<int?> _selectedAnswers = [];
  List<bool> _correctness = [];

  @override
  void initState() {
    super.initState();
    _selectedAnswers = List<int?>.filled(_questions.length, null);
    _correctness = List<bool>.filled(_questions.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.indigo],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: _questions.length,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemBuilder: (context, index) {
            final question = _questions[index];
            return Card(
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 6,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Q${index + 1}: ${question['question']}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 12),
                    ...List.generate(
                      question['options'].length,
                      (optionIndex) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedAnswers[index] = optionIndex;
                            _correctness[index] = optionIndex == question['answer'];
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: _selectedAnswers[index] == optionIndex
                                  ? (_correctness[index]
                                      ? Colors.green
                                      : Colors.red)
                                  : Colors.grey.shade300,
                              width: 2,
                            ),
                            color: _selectedAnswers[index] == optionIndex
                                ? (_correctness[index]
                                    ? Colors.green.shade100
                                    : Colors.red.shade100)
                                : Colors.grey.shade100,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  color: _selectedAnswers[index] == optionIndex
                                      ? (_correctness[index]
                                          ? Colors.green
                                          : Colors.red)
                                      : Colors.grey.shade300,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  _selectedAnswers[index] == optionIndex
                                      ? (_correctness[index]
                                          ? Icons.check
                                          : Icons.close)
                                      : Icons.circle_outlined,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  question['options'][optionIndex],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
