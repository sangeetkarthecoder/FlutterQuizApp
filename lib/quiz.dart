import 'package:flutter/material.dart';
import 'package:quizpp/Data/question_data.dart';
import 'package:quizpp/question_screen.dart';
import 'package:quizpp/start_screen.dart';
import 'package:quizpp/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeState = "start-screen";

  List<String> answers = [];

  @override
  void initState() {
    super.initState();
  }

  void chooseAnswer(String answer) {
    answers.add(answer);

    if (answers.length == questions.length) {
      setState(() {
        activeState = "result-screen";
      });
    }
  }

  switchScreen() {
    setState(() {
      answers = [];
      activeState = "question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeState == "question-screen") {
      screenWidget = QuestionScreen(chooseAnswer: chooseAnswer);
    }

    if (activeState == "result-screen") {
      screenWidget =
          ResultScreen(chosenAnswers: answers, restart: switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168),
          ])),
            child: screenWidget
        ),
      ),
    );
  }
}
