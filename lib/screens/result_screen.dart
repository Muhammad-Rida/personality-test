import 'package:flutter/material.dart';
import 'start_screen.dart';

class ResultScreen extends StatelessWidget {
  final int thinkerScore;
  final int feelerScore;
  final int plannerScore;
  final int adventurerScore;

  const ResultScreen({
    super.key,
    required this.thinkerScore,
    required this.feelerScore,
    required this.plannerScore,
    required this.adventurerScore,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, String> personalityMessages = {
      'Thinker': 'You are a Thinker\nLogical, curious, and focused on ideas.',
      'Feeler': 'You are a Feeler\nEmpathetic, warm, and guided by emotion.',
      'Planner': 'You are a Planner\nOrganized, strategic, and goal-oriented.',
      'Adventurer':
          'You are an Adventurer\nSpontaneous, bold, and always exploring.',
    };

    String winner = 'Thinker';
    int highestScore = thinkerScore;

    if (feelerScore > highestScore) {
      highestScore = feelerScore;
      winner = 'Feeler';
    }
    if (plannerScore > highestScore) {
      highestScore = plannerScore;
      winner = 'Planner';
    }
    if (adventurerScore > highestScore) {
      highestScore = adventurerScore;
      winner = 'Adventurer';
    }

    List<String> tiedWinners = [];
    if (thinkerScore == highestScore) tiedWinners.add('Thinker');
    if (feelerScore == highestScore) tiedWinners.add('Feeler');
    if (plannerScore == highestScore) tiedWinners.add('Planner');
    if (adventurerScore == highestScore) tiedWinners.add('Adventurer');

    if (tiedWinners.length > 1) {
      winner = tiedWinners[0];
    }

    return QuizBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Your Result',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text(
                  winner,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  personalityMessages[winner]!,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          if (tiedWinners.length > 1)
            Text(
              '(Note: Multiple types tied, showing ${tiedWinners[0]})',
              style: const TextStyle(
                color: Colors.yellow,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (ctx) => const StartScreen()),
                (route) => false,
              );
            },
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
