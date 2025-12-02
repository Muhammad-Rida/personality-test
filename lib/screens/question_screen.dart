import 'package:flutter/material.dart';
import '../models/question.dart';
import '../models/answer.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final int index;
  final int total;
  final void Function(Answer) onAnswerSelected;

  const QuestionScreen({
    Key? key,
    required this.question,
    required this.index,
    required this.total,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = '${index + 1} / $total';
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${index + 1} of $total'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LinearProgressIndicator(value: (index + 1) / total, minHeight: 6),
            const SizedBox(height: 18),
            Text(
              question.text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.separated(
                itemCount: question.answers.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, i) {
                  final a = question.answers[i];
                  return ElevatedButton(
                    onPressed: () => onAnswerSelected(a),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14.0,
                        horizontal: 12.0,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(a.text, style: const TextStyle(fontSize: 16)),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Progress: $progress',
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
