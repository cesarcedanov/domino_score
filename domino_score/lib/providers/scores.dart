import 'package:flutter/foundation.dart';

class RoundScore {
  final String id;
  final int scoreTeam1;
  final int scoreTeam2;

  RoundScore(
    this.id,
    this.scoreTeam1,
    this.scoreTeam2,
  );
}

class Team {
  String namePlayer1;
  String namePlayer2;
}

class GameScore with ChangeNotifier {
  int limitScore = 200;
  final Team team1;
  final Team team2;
  List<RoundScore> roundScores = [];

  GameScore(
    this.limitScore,
    this.team1,
    this.team2,
    this.roundScores,
  );

  void addRoundScore(String id, int scoreTeam1, int scoreTeam2) {
    roundScores
        .add(RoundScore(DateTime.now().toString(), scoreTeam1, scoreTeam2));
    notifyListeners();
  }

  void removeRoundScore(String id) {
    roundScores.removeWhere((round) => round.id == id);
    notifyListeners();
  }

  int get team1CurrentScore {
    return roundScores.fold(0, (curr, next) => curr + next.scoreTeam1);
  }

  int get team2CurrentScore {
    return roundScores.fold(0, (curr, next) => curr + next.scoreTeam2);
  }
}
