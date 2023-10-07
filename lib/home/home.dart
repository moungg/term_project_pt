import 'package:flutter/material.dart';
import 'package:pt_system/chat/chat.dart';
import 'package:pt_system/callender/callender.dart';
import 'package:pt_system/matching/matching.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('홈'),
          bottom: TabBar(
            tabs: [
              Tab(text: '채팅'),
              Tab(text: '캘린더'),
              Tab(text: '매칭'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChatScreen(),
            CalendarScreen(),
            MatchingScreen(),
          ],
        ),
      ),
    );
  }
}
