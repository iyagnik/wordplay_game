// models/game_state.dart

class GameState {
  final String word;
  final int score;
  final int level;
  final bool isGameOver;

  GameState({
    required this.word,
    required this.score,
    required this.level,
    this.isGameOver = false,
  });

  GameState copyWith({
    String? word,
    int? score,
    int? level,
    bool? isGameOver,
  }) {
    return GameState(
      word: word ?? this.word,
      score: score ?? this.score,
      level: level ?? this.level,
      isGameOver: isGameOver ?? this.isGameOver,
    );
  }
}
