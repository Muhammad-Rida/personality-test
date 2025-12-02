import 'package:flutter/material.dart';
import '../models/personality.dart';

class ResultScreen extends StatelessWidget {
  final Personality personality;
  final String message;
  final VoidCallback onRestart;

  const ResultScreen({
    Key? key,
    required this.personality,
    required this.message,
    required this.onRestart,
  }) : super(key: key);

  String _prettyName(Personality p) {
    switch (p) {
      case Personality.Thinker:
        return 'Thinker';
      case Personality.Feeler:
        return 'Feeler';
      case Personality.Planner:
        return 'Planner';
      case Personality.Adventurer:
        return 'Adventurer';
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = _prettyName(personality);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Result'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 28.0),
        child: Column(
          children: [
            Text(
              'You are a $name',
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            Text(
              message,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            ElevatedButton(
              onPressed: onRestart,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                child: Text('Retake Test'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
