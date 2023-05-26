import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {

  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 250,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "Learn flutter the fun way!",
              style: TextStyle(color: Color.fromARGB(255, 222, 208, 245), fontSize: 22),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: OutlinedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              onPressed: startQuiz,
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start Quiz"),
            ),
          ),
        ],
      ),
    );
  }
}
