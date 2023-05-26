import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizpp/Data/question_data.dart';
import 'package:quizpp/summary_ui.dart';
import 'package:quizpp/question_screen.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.chosenAnswers, required this.restart});

  List<String> chosenAnswers;
  final void Function() restart;

  List<Map<String, Object>> getSummaryAns() {

    List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; ++i) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_ans': questions[i].options[0],
        'user_ans': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryList = getSummaryAns();
    final total = questions.length;
    final correct = summaryList
        .where((element) => element['user_ans'] == element['correct_ans'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.all(30),
            child: Text(
              "You answered $correct out of $total answers correctly!",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 30),
            child: SummaryUI(
              summaryList: summaryList,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
            child: ElevatedButton.icon(
              onPressed: restart,
              icon: const Icon(Icons.restart_alt),
              label: const Text("Restart Quiz"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  textStyle: const TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
