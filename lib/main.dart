import 'package:flutter/material.dart';
import 'questions.dart';
import 'models/answer.dart';
import 'models/personality.dart';
import 'models/personality-messages.dart';
import 'screens/start_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(const PersonalityTestApp());
}

class PersonalityTestApp extends StatefulWidget {
  const PersonalityTestApp({Key? key}) : super(key: key);

  @override
  State<PersonalityTestApp> createState() => _PersonalityTestAppState();
}

class _PersonalityTestAppState extends State<PersonalityTestApp> {
  // -1 => start screen, 0..questions.length-1 => question index, questions.length => result
  int _currentIndex = -1;

  // initialize scores
  final Map<Personality, int> _scores = {
    for (var p in Personality.values) p: 0,
  };

  void _startTest() {
    setState(() {
      _currentIndex = 0;
      _scores.updateAll((key, value) => 0);
    });
  }

  void _answerSelected(Answer answer) {
    setState(() {
      _scores[answer.personality] = (_scores[answer.personality] ?? 0) + 1;

      if (_currentIndex < questions.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = questions.length; // go to result screen
      }
    });
  }

  void _restart() {
    setState(() {
      _currentIndex = -1;
      _scores.updateAll((key, value) => 0);
    });
  }

  Personality _calculateResult() {
    Personality best = Personality.values.first;
    int bestScore = -1;

    for (var p in Personality.values) {
      final s = _scores[p] ?? 0;
      if (s > bestScore) {
        bestScore = s;
        best = p;
      } else if (s == bestScore) {
        // deterministic tie-breaker: keep the personality with lower index in enum (already best)
        // so do nothing (keeps existing 'best')
      }
    }
    return best;
  }

  @override
  Widget build(BuildContext context) {
    Widget home;

    if (_currentIndex == -1) {
      home = StartScreen(onStart: _startTest);
    } else if (_currentIndex < questions.length) {
      final q = questions[_currentIndex];
      home = QuestionScreen(
        question: q,
        index: _currentIndex,
        total: questions.length,
        onAnswerSelected: _answerSelected,
      );
    } else {
      final result = _calculateResult();
      final message = personalityMessages[result] ?? '';
      home = ResultScreen(
        personality: result,
        message: message,
        onRestart: _restart,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personality Test',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: home,
    );
  }
}
