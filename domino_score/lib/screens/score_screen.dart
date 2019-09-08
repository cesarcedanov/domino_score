import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/settings.dart';

class ScoreScreen extends StatelessWidget {
  static const routeName = '/score';
  @override
  Widget build(BuildContext context) {
    final gameData = Provider.of<Settings>(context);
    return Center(
      child: Text('${gameData.team1Name} vs ${gameData.team2Name}'),
    );
  }
}
