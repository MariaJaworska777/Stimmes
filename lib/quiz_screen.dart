import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Question {
  final String text;
  final List<String> options;

  Question({required this.text, required this.options});
}


class QuizContent extends StatefulWidget {
  const QuizContent({super.key});

  @override
  State<QuizContent> createState() => _QuizContentState();
}

class _QuizContentState extends State<QuizContent> {
  int _currentIndex = 0;
  final Map<int, int> _selectedAnswers = {};

  @override
  void reassemble() {
    super.reassemble();
    setState(() {
      _currentIndex = 0; 
      _selectedAnswers.clear();
    });
  }

  final List<Question> _questions = [
    Question(
      text: 'Choose an activity prompt',
      options: ['walk', 'sit', 'lie down', 'close eyes'],
    ),
    Question(
      text: 'Choose a grounding technique',
      options: ['54321', '4-6 breath', 'counted tapping breaths', 'loud exhales'],
    ),
    Question(
      text: 'Choose a stim tool',
      options: ['rings', 'fidgets', 'resistance bands', 'spiky balls'],
    ),
    Question(
      text: 'Choose a sound',
      options: ['silence', 'white noise', 'brown noise', 'rain'],
    ),
    Question(
      text: 'Choose a game',
      options: ['puzzle', 'sudoku', 'solitaire', 'crossword'],
    ),
    Question(
      text: 'Choose one other option',
      options: ['text-to-speech', 'writing box', 'brightness', 'volume'],
    ),
  ];

  void _onOptionSelected(int optionIndex) {
    _selectedAnswers[_currentIndex] = optionIndex;

    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      _showSummary();
    }
  }

  void _showSummary() {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: const Text('Your answers have been saved'),
      content: const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text('Personalizing your experience...'),
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true, 
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentIndex];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(animation),
            child: child,
          ),
        );
      },
      child: Padding(
        key: ValueKey<int>(_currentIndex),
        padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                fontSize: 22.0,
                fontFamily: 'Czcionka',
                // fontWeight: FontWeight.bold,
                // color: Color(0xff61a0af),
                color: Color.fromARGB(232, 42, 41, 41),
              ),
            ),
            const SizedBox(height: 30.0),
            ...List.generate(4, (optionIndex) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff96c9dc),
                    foregroundColor: Color.fromRGBO(240, 108, 155, 1),
                    elevation: 5.0,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () => _onOptionSelected(optionIndex),
                  child: Text(
                    currentQuestion.options[optionIndex],
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Czcionka3'
                      ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}