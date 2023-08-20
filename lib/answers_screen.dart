import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/summary_list.dart';

class AnsScreen extends StatelessWidget {
  const AnsScreen(
      {super.key, required this.selectedAnswers, required this.switchScreen});

  final List<String> selectedAnswers;
  final void Function() switchScreen;

  List<Map<String, Object>> summaryBox() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add(
        {
          'questions-index': i,
          'question': questions[i].text,
          'correct-answer': questions[i].answers[0],
          'user-answer': selectedAnswers[i]
        },
      );
    }

    return summary;
  }


  //the below method is called GETTER SETTER method
  //in this we can treat a function as a variable
  // by using the keyword 'get' in front of function name and removing the
  //curly braces

  // List<Map<String, Object>> get summaryBox {
  //   final List<Map<String, Object>> summary = [];
  //
  //   for (var i = 0; i < selectedAnswers.length; i++) {
  //     summary.add(
  //       {
  //         'questions-index': i,
  //         'question': questions[i].text,
  //         'correct-answer': questions[i].answers[0],
  //         'user-answer': selectedAnswers[i]
  //       },
  //     );
  //   }
  //
  //   return summary;
  // }

  @override
  Widget build(context) {
    final summaryData = summaryBox();
    //by using the GETTER SETTER method we can directly eliminate the above
    // initialization

    final totalQuestions = questions.length;

    // where method creates a new list stores the 'data' if the specified condition
    // is true and does not include the 'data' int the list if it is false
    final correctAnswers = summaryData.where((data) {
      return data['user-answer'] ==
          data['correct-answer']; //return type bool i.e. true or false
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "You've answered $correctAnswers out of $totalQuestions answers correctly!",
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoCondensed(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 214, 121, 243),


              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SummaryList(
                summaryBox()), // here summaryBox function pointer is not
            //returned instead function call is made to return the summary list
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: switchScreen,
                icon: const Icon(CupertinoIcons.refresh_thin),
                label: const Text('Retry'))
          ],
        ),
      ),
    );
  }
}
