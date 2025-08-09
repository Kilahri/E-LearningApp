import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;

  final List<Map<String, Object>> questions = [
    {
      "question": "What organ pumps blood through your body?",
      "options": ["Brain", "Heart", "Lungs", "Stomach"],
      "answer": "Heart",
    },
    {
      "question": "Which part of the body helps you breathe?",
      "options": ["Liver", "Lungs", "Kidneys", "Skin"],
      "answer": "Lungs",
    },
    {
      "question": "What part of your body helps you see?",
      "options": ["Eyes", "Ears", "Hands", "Nose"],
      "answer": "Eyes",
    },
    {
      "question": "Which part of your body helps you smell?",
      "options": ["Nose", "Mouth", "Ears", "Skin"],
      "answer": "Nose",
    },
  ];

  void checkAnswer(String selected) {
    if (selected == questions[currentQuestion]["answer"]) {
      score++;
    }
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text("Quiz Finished!"),
            content: Text("Your score: $score / ${questions.length}"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parts of the Body Quiz")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestion]["question"] as String,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...(questions[currentQuestion]["options"] as List<String>).map((
              option,
            ) {
              return ElevatedButton(
                onPressed: () => checkAnswer(option),
                child: Text(option),
              );
            }),
          ],
        ),
      ),
    );
  }
}
