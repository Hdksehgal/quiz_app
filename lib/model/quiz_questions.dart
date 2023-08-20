import 'package:flutter/material.dart';

class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;
  // to shuffle the options we'll use shuffle() method but since
  // this methods unlike the map() {} method shuffles the data internally in the
  // original list therefore we'll create a copy of the list to store the shuffled data

  // the below concept is called Mutating values in Memory

  List<String> getShuffledAnswers () {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();// shuffle() method is a void funnction it doesn't return any value
    return shuffledList;
  }






}