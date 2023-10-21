import 'package:flutter/material.dart';
import 'home.dart';
import 'calender.dart';
import 'matching.dart';
import 'menuwidget.dart';
import 'chat_tab.dart'; // Import ChatTab

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
      ChatTab(), // Use ChatTab instead of ChatPage
      CalendarPage(),
      MatchingPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Fit-T'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: MenuWidget(
        currentIndex: _currentIndex,
        onMenuItemTapped: onMenuItemTapped,
      ),
    );
  }
}
