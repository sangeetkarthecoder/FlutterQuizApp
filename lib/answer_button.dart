import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final void Function() onTap;
  final String answer;

  const AnswerButton({super.key, required this.answer, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: onTap,
        child: Text(answer, textAlign: TextAlign.center,));
  }
}
