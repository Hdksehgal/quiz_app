import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryList extends StatelessWidget {
  const SummaryList(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // to make the question index align in front of question
                // unlike the previous alignment

                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                      decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(100),
                        color: data['user-answer'] == data['correct-answer']
                            ? Colors.cyan
                            : Colors.redAccent,
                      ),
                      child: Text(
                          ((data['questions-index'] as int) + 1).toString()
                      )
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // to align all the text left side

                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data['correct-answer'] as String,
                          style: TextStyle(color: Colors.white54),
                        ),
                        Text(
                          data['user-answer'] as String,
                          style: TextStyle(
                              color:
                                  data['user-answer'] == data['correct-answer']
                                      ? Colors.cyan
                                      : Colors.redAccent
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
