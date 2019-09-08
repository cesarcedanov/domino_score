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
      return '';
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
    if (!isOnTeams) {
      return '';
    }
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
    if (newName == null) {
      return;
    }
    player1Name = newName;
    notifyListeners();
  }

  void setPlayer2Name(String newName) {
    if (newName == null) {
      return;
    }
    player2Name = newName;
    notifyListeners();
  }

  void setPlayer3Name(String newName) {
    if (newName == null) {
      return;
    }
    player3Name = newName;
    notifyListeners();
  }

  void setPlayer4Name(String newName) {
    if (newName == null) {
      return;
    }
    player4Name = newName;
    notifyListeners();
  }
}
