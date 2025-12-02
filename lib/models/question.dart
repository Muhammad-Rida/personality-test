import 'answer.dart';

class Question {
  final String text;
  final List<Answer> answers;

  Question({required this.text, required this.answers});
}

class Answer {
  final String text;
  final Personality personality;

  Answer({required this.text, required this.personality});
}

enum Personality { Thinker, Feeler, Planner, Adventurer }

const Map<Personality, String> personalityMessages = {
  Personality.Thinker:
      'You are a Thinker — Logical, analytical, and curious. You enjoy solving problems and understanding how things work.',
  Personality.Feeler:
      'You are a Feeler — Empathetic, warm, and relationship-oriented. You care about others and value emotional connection.',
  Personality.Planner:
      'You are a Planner — Organized, practical, and goal-oriented. You like structure and clear steps to achieve results.',
  Personality.Adventurer:
      'You are an Adventurer — Spontaneous, bold, and eager to explore. You thrive on new experiences and taking risks.',
};
