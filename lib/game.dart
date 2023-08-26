// game.dart

import 'package:flutter/material.dart';
import 'package:wordsplay_demo/words.dart';
import 'game_state.dart';
import 'guess_word_form.dart';
import 'score_display.dart';
import 'word_service.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final WordService _wordService = WordService();
  late GameState _gameState;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  int lastscr = 0;
  void onGameOver() {
    lastscr = _gameState.score;
    _resetGame();
  }

  void _startNewGame() {
    _gameState = GameState(
      word: _wordService.getRandomWord(),
      score: 0,
      level: 1,
    );
  }

  void _resetGame() {
    _gameState = GameState(
      word: _wordService.getRandomWord(),
      score: 0,
      level: 1,
    );
  }

  bool isGameOver = false;

  void _makeGuess(String value) {
    if (all_words.contains(value)) {
      // Update score and level
      _gameState = _gameState.copyWith(
        score: _gameState.score + 1,
        level: _gameState.level + 1,
        word: _wordService.getRandomWord(),
      );
    } else {
      // Game over
      _gameState = _gameState.copyWith(isGameOver: true);
      isGameOver = true;

      onGameOver();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WordPlay'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 48,
        ),
        child: Column(
          children: [
            ScoreDisplay(score: _gameState.score),
            GuessWordForm(
              currentWord: _gameState.word,
              onSubmit: _makeGuess,
            ),
            if (!_gameState.isGameOver)
              Text(
                'Last Score: ${lastscr}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
