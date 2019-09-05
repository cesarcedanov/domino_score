import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/settings.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  final player1Controller = TextEditingController();
  final player2Controller = TextEditingController();
  final player3Controller = TextEditingController();
  final player4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final settingData = Provider.of<Settings>(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Game Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '1 vs 3',
                style: TextStyle(color: Colors.grey),
              ),
              Switch.adaptive(
                onChanged: (_) => settingData.toggleIsOnTeams(),
                value: settingData.isOnTeams,
              ),
              Text(
                '2 vs 2',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            height: 300,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Spacer(),
                    Text('Player 1'),
                    Spacer(),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Player 2'),
                    Spacer(),
                    Text('Player 4'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Spacer(),
                    Text('Player 3'),
                    Spacer(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
