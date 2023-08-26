// widgets/guess_word_form.dart

import 'package:flutter/material.dart';

class GuessWordForm extends StatefulWidget {
  final String currentWord;
  final void Function(String) onSubmit;

  const GuessWordForm(
      {required this.currentWord, required this.onSubmit, super.key});

  @override
  _GuessWordFormState createState() => _GuessWordFormState();
}

class _GuessWordFormState extends State<GuessWordForm> {
  String get _shuffledWord {
    final characters = widget.currentWord.characters.toList()..shuffle();
    final characterCodes =
        characters.map((char) => char.codeUnitAt(0)).toList();
    return String.fromCharCodes(characterCodes);
  }

  final _textController = TextEditingController();

  void _submitGuess() {
    widget.onSubmit(_textController.text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Make a Word Using:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          Text(
            _shuffledWord,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            controller: _textController,
            onSubmitted: (_) => _submitGuess(),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: _submitGuess,
            child: const Text('Go!'),
          ),
        ],
      ),
    );
  }
}
