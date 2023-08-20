import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Start extends StatelessWidget {
  const Start(this.switchScreen, {super.key});
  // here we are accepting a function pointer as a value which doesn't accept any arguments and also doesn't return any type
  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //there are two ways of setting the transparency of the image
        //First by wrapping the widget with opacity and setting the opacity between 0 to 1
        //Second by changing the color of the image
        Center(
            child: Image.asset(
          'assets/images/quiz-logo.png',
          height: 300,
          color: const Color.fromRGBO(255, 255, 255, 150),
        )),

        // Opacity(
        //   opacity: .7,
        //   child: Center(
        //       child: Image.asset(
        //     'assets/images/quiz-logo.png',
        //     height: 300,
        //   )
        //   ),
        // ),

        const SizedBox(height: 100),
        Text(' Welcome to the Flutter Quiz! ',
            style:
                GoogleFonts.robotoCondensed(color: Colors.white, fontSize: 20)),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
            // to add icon in the button we can just replace OutlinedButton with OutlinedButton.icon
            icon: const Icon(Icons.start_outlined),
            onPressed: switchScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white70,
            ),
            label: const Text(
              // in the case of OutlinedButton.icon the child: is replaced by label:
              'Start',
            ))
      ],
    );
  }
}
