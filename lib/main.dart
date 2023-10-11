import 'package:flutter/material.dart';
import 'home.dart';
import 'chat.dart';
import 'calender.dart';
import 'matching.dart';
import 'menuwidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void onMenuItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomePage(),
      ChatPage(),
      CalendarPage(),
      MatchingPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Fit-T'),
        backgroundColor: Colors.black, // AppBar 배경색: 검은색
        foregroundColor: Colors.white, // AppBar 글씨색: 흰색
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: MenuWidget(
        currentIndex: _currentIndex,
        onMenuItemTapped: onMenuItemTapped,
      ),
    );
  }
}
