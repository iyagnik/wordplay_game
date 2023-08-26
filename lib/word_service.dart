// services/word_service.dart
import 'package:wordsplay_demo/words.dart';
import 'dart:math';

class WordService {
  List<String> words = all_words;

  String getRandomWord() {
    final random = Random();
    final index = random.nextInt(words.length);
    return words[index];
  }

  bool isValidWord(String guess) {
    return words.contains(guess);
  }
}
