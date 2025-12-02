import 'package:flutter/material.dart';
import '../models/personality.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onStart;

  const StartScreen({Key? key, required this.onStart}) : super(key: key);

  // Names for display
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

  // Icons defined HERE (no separate file)
  IconData _iconFor(Personality p) {
    switch (p) {
      case Personality.Thinker:
        return Icons.lightbulb_outline;
      case Personality.Feeler:
        return Icons.favorite_border;
      case Personality.Planner:
        return Icons.event_note_outlined;
      case Personality.Adventurer:
        return Icons.explore_outlined;
    }
  }

  // Colors defined HERE too
  Color _colorFor(Personality p) {
    switch (p) {
      case Personality.Thinker:
        return Colors.deepPurple;
      case Personality.Feeler:
        return Colors.pink;
      case Personality.Planner:
        return Colors.teal;
      case Personality.Adventurer:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personality Test'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Discover Your Personality Type',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // Icons row — REQUIRED by the PDF
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: Personality.values.map((p) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: _colorFor(p).withOpacity(0.15),
                      child: Icon(_iconFor(p), color: _colorFor(p), size: 28),
                    ),
                    const SizedBox(height: 8),
                    Text(_prettyName(p), style: const TextStyle(fontSize: 14)),
                  ],
                );
              }).toList(),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: onStart,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text('Start Test', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
