import 'package:flutter/material.dart';
import 'home.dart';
import 'chat.dart';
import 'calender.dart';
import 'matching.dart';
import 'menuwidget.dart';
import 'login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
      const MyHomePage(),
      const ChatPage(),
      const CalendarPage(),
      MatchingPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/title.png', height: 40),
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
