import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/settings.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var gameSettings = Settings(isOnTeams: true, limitScore: 300);

  @override
  Widget build(BuildContext context) {
    // final gameSettings = Provider.of<Settings>(context);
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Game Style',
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
                  'Indivual',
                  style: TextStyle(color: Colors.grey),
                ),
                Switch.adaptive(
                  onChanged: (_) => gameSettings.toggleIsOnTeams(),
                  value: gameSettings.isOnTeams,
                ),
                Text(
                  'Teams',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.black87,
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Insert Players Names',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 125,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: 'Type in the name',
                          labelText: 'Player 1 Name',
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            gameSettings.setPlayer1Name(value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 125,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: 'Type in the name',
                          labelText: 'Player 2 Name',
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            gameSettings.setPlayer2Name(value);
                          }
                        },
                      ),
                    ),
                    Container(
                      width: 125,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: 'Type in the name',
                          labelText: 'Player 4 Name',
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            gameSettings.setPlayer4Name(value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 125,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Type in the name',
                          labelText: 'Player 3 Name',
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            gameSettings.setPlayer3Name(value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.black87,
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Limit Score',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DropdownButton<int>(
              value: gameSettings.limitScore,
              onChanged: (int value) {
                if (value != null) {
                  gameSettings.setLimitScore(value);
                }
              },
              items: <int>[100, 200, 250, 300, 500]
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('$value'),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
