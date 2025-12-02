import 'package:flutter/material.dart';
import 'questions_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return QuizBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Discover your',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const Text(
            'Personality Type!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '💖   🗺️',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 10),
          const Text(
            '🧠   🗓️',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => const QuestionScreen()),
              );
            },
            child: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}

class QuizBackground extends StatelessWidget {
  final Widget child;

  const QuizBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        child: Center(child: child),
      ),
    );
  }
}
