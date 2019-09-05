import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scores.dart';
import '../providers/settings.dart';
import './settings_screen.dart';
import './score_screen.dart';
import './history_screen.dart';

class TabsNavigation extends StatefulWidget {
  @override
  _TabsNavigationState createState() => _TabsNavigationState();
}

class _TabsNavigationState extends State<TabsNavigation> {
  List<Map<String, Object>> _pages;

  int _selectedTabIndex = 1;

  @override
  void initState() {
    _pages = [
      {
        "title": "Settings",
        "screen": SettingsScreen(),
        "actions": <Widget>[],
      },
      {
        "title": "Score",
        "screen": ScoreScreen(),
        "actions": <Widget>[
          FlatButton(
            child: Text(
              'NEW GAME',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          )
        ],
      },
      {
        "title": "History",
        "screen": HistoryScreen(),
        "actions": <Widget>[],
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedTabIndex]["title"]),
        actions: _pages[_selectedTabIndex]["actions"],
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Settings(limitScore: 200, isOnTeams: true),
          ),
          ChangeNotifierProvider.value(
            value: GameScore([]),
          ),
        ],
        child: _pages[_selectedTabIndex]["screen"],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            title: Text('Score'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('History'),
          ),
        ],
      ),
      floatingActionButton: _selectedTabIndex == 1
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.add),
              onPressed: () {},
            )
          : null,
    );
  }
}
