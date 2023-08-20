import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuesScreen extends StatefulWidget {
  QuesScreen({super.key, required this.onstoreAnswers});
  void Function(String answer) onstoreAnswers;

  State<QuesScreen> createState() {
    return _QuesScreenState();
  }
}

class _QuesScreenState extends State<QuesScreen> {
  var currentIndex = 0;

  void nextQuestion(String answer) {
    widget.onstoreAnswers(answer);

    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentquestions = questions[currentIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40), // to add spacing from the sides
        child: Column(
          //Alternate approach to below is above
          mainAxisAlignment: MainAxisAlignment.center,
          //and wrapping text with center
          // widget , we can wrap the column with sized box

          crossAxisAlignment:
              CrossAxisAlignment.stretch, // this is done in order
          //to make the buttons occupy the whole space on their both sides

          children: [
            Text(
              currentquestions.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoCondensed(
                  color: Color.fromARGB(255, 214, 121, 243),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),

            ...currentquestions.getShuffledAnswers().map((answers) {
              //Chaining
              return AnswerButton(
                  text: answers,
                  onTap: () {
                    nextQuestion(answers);
                  }
              );
            })
            // above is the method of mapping ,what it does is it converts the answers
            //which are of string type into the widget type
            // "..." these three dots are in-built keyword used to do spreading
            //it spreads the list elements
            // these three dots will simply take all the values in a list or a iterable
            // and pull them out of the list or iterable and place them as comma-separated values
            // three dots is used beacuse children[] expects a list of widgets only but we are making a list
            // in another list which is not what children[] wants to overcome this error we use "..." .

            //we don't prefer the below method because as developers we should dup;icate
            //the widgets so we use the above method
            // AnswerButton(text: currentquestions.answers[0],onTap: () {},),
            // AnswerButton(text: currentquestions.answers[1],onTap: () {},),
            // AnswerButton(text: currentquestions.answers[2],onTap: () {},),
            // AnswerButton(text: currentquestions.answers[3],onTap: () {},),
          ],
        ),
      ),
    );
  }
}
