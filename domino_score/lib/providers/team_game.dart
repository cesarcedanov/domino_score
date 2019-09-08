import 'package:flutter/foundation.dart';
import './settings.dart';

class TeamsRoundScore {
  final int team1;
  final int team2;

  TeamsRoundScore(this.team1, this.team2);
}

class TeamsGame with ChangeNotifier {
  Settings gameSettings;
  List<TeamsRoundScore> roundScores = [];

  TeamsGame({
    this.gameSettings,
    this.roundScores,
  });

  void addRoundScore(int team1Score, int team2Score) {
    roundScores.add(TeamsRoundScore(team1Score, team2Score));
    notifyListeners();
  }

  void removeRoundScore(int index) {
    roundScores.removeAt(index);
    notifyListeners();
  }

  int get currentTeam1Score {
    return roundScores.fold(0, (curr, round) => curr + round.team1);
  }

  int get currentTeam2Score {
    return roundScores.fold(0, (curr, round) => curr + round.team2);
  }
}
