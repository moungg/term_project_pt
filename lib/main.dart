import 'package:flutter/material.dart';
import 'home.dart';
import 'chat.dart';
import 'calender.dart';
import 'matching.dart';
import 'menuwidget.dart';
import 'login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cafe24Danjunghae',
      ),
      home: LoginPage(), // 앱 시작 시 LoginPage 표시
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
      const ChatPage(),
      const CalendarPage(),
      const MatchingPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/title.png', height: 40),
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
