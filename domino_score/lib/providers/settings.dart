import 'package:flutter/foundation.dart';

class Settings with ChangeNotifier {
  int limitScore;
  bool isOnTeams;
  String player1Name;
  String player2Name;
  String player3Name;
  String player4Name;

  Settings({
    @required this.limitScore,
    @required this.isOnTeams,
    this.player1Name,
    this.player2Name,
    this.player3Name,
    this.player4Name,
  });

  String get team1Name {
    if (!isOnTeams) {
      return 'It looks like a Individual Players Game';
    }
    if (player1Name != null && player3Name != null) {
      return '$player1Name / $player3Name';
    } else if (player1Name != null && player3Name == null) {
      return player1Name;
    } else if (player1Name == null && player3Name != null) {
      return player3Name;
    } else {
      return 'Odd';
    }
  }

  String get team2Name {
    if (player2Name != null && player4Name != null) {
      return '$player2Name / $player4Name';
    } else if (player2Name != null && player4Name == null) {
      return player2Name;
    } else if (player2Name == null && player4Name != null) {
      return player3Name;
    } else {
      return 'Pair';
    }
  }

  void setLimitScore(int newLmitScore) {
    limitScore = newLmitScore;
    notifyListeners();
  }

  void toggleIsOnTeams() {
    isOnTeams = !isOnTeams;
    notifyListeners();
  }

  void setPlayer1Name(String newName) {
    player1Name = newName;
    notifyListeners();
  }

  void setPlayer2Name(String newName) {
    player2Name = newName;
    notifyListeners();
  }

  void setPlayer3Name(String newName) {
    player3Name = newName;
    notifyListeners();
  }

  void setPlayer4Name(String newName) {
    player4Name = newName;
    notifyListeners();
  }
}

/*
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
*/
