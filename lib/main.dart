import 'package:flutter/material.dart';
import 'home.dart';
//import 'calender.dart';
import 'matching.dart';
import 'menuwidget.dart';
import 'chat_tab.dart'; // Import ChatTab
import 'login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
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
      ChatTab(), // Use ChatTab instead of ChatPage
      //CalendarPage(),
      const ChatPage(),
      const CalendarPage(),
      MatchingPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Fit-T'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Image.asset('assets/title.png', height: 40),
        backgroundColor: Colors.black, // AppBar 배경색: 검은색
        foregroundColor: Colors.white, // AppBar 글씨색: 흰색
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: MenuWidget(
        currentIndex: _currentIndex,
        onMenuItemTapped: onMenuItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the login screen when the button is pressed
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
        },
        child: Icon(Icons.login),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
