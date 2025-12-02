import 'package:flutter/material.dart';
import '/questions.dart';
import 'result_screen.dart';
import 'start_screen.dart'; // for QuizBackground

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int index = 0;

  int thinkerScore = 0;
  int feelerScore = 0;
  int plannerScore = 0;
  int adventurerScore = 0;

  void _answerSelected(String type) {
    setState(() {
      if (type == 'Thinker') thinkerScore++;
      if (type == 'Feeler') feelerScore++;
      if (type == 'Planner') plannerScore++;
      if (type == 'Adventurer') adventurerScore++;

      index++;
    });

    if (index >= questionsList.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => ResultScreen(
            thinkerScore: thinkerScore,
            feelerScore: feelerScore,
            plannerScore: plannerScore,
            adventurerScore: adventurerScore,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionsList[index];
    final questionText = currentQuestion['question'] as String;
    final answers = currentQuestion['answers'] as List<Map<String, String>>;

    return QuizBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Question ${index + 1}/${questionsList.length}',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 20),
          Text(
            questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 300,
            child: Column(
              children: answers.map((ans) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: AnswerButton(
                    text: ans['text']!,
                    onPressed: () => _answerSelected(ans['type']!),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AnswerButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(text),
    );
  }
}
