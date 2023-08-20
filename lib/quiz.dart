import 'package:flutter/material.dart';
import 'package:quiz_app/answers_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {

  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // here '_' decribes that the class is private and only
  // accessed by this file only

  List<String> selectedAnswers = [];
  //we have replaced final List<String> with var

  Widget? currentScreen ;

  void storeAnswer (String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length)
      {
        setState(() {
          //selectedAnswers = [];
          // we will remove this so that the selected answers can be used in result screen
          activeScreen = 'ans-screen';
        });
      }
  }

  // Widget? activescreen ;
  var activeScreen = 'start-screen';
  // the error occuring when writing only "switchScreen" as argument is because
  //both the above variable initialization and method creation below happens at the same point of time
  // this is overcamed by using initState method
  // what it does is when the class is created by constructor it does some extra initialization in the form of initState
  //the initState is called immediately after the object(instance of class) is created
  // this initState is only executed once

  // void initState() {
  //   activescreen = Start(switchScreen);
  //   super.initState();
  // }
  //
  // void switchScreen(){
  //   setState(() {
  //     activescreen = const QuesScreen();
  //   });
  // }

  //another approach of rendering the content if by rendering the content conditionally



  void switchScreen(){
    setState(() {
      activeScreen = 'ques-screen';
    });
  }

  void startAgain(){
    setState(() {
      activeScreen = 'ques-screen';
      selectedAnswers = [];
    });
  }


  @override
  Widget build(context) {
    currentScreen = Start(switchScreen);

    if(activeScreen == 'ques-screen')
    {
      currentScreen = QuesScreen(onstoreAnswers: storeAnswer,);
    }

    if(activeScreen == 'ans-screen')
      {
        currentScreen = AnsScreen(selectedAnswers: selectedAnswers, switchScreen: startAgain,);
      }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.black87,
                Colors.deepPurple,
                Colors.deepPurpleAccent
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: //activescreen
          // activeScreen == 'start-screen' //2
          //  ? Start(switchScreen) : QuesScreen(onstoreAnswers: storeAnswer,), //2
          currentScreen,


        ),
      ),
    );
  }
}