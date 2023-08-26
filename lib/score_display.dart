// widgets/score_display.dart

import 'package:flutter/material.dart';

class ScoreDisplay extends StatelessWidget {
  final int score;

  const ScoreDisplay({required this.score, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Score: $score',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
