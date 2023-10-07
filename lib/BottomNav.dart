import 'package:flutter/material.dart';

class BottomNavigationButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // 홈 버튼
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.home_outlined),
                onPressed: () {
                  // 홈 버튼을 눌렀을 때 수행할 작업
                },
              ),
              Text(
                '홈',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // 검색 버튼
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.explore_outlined),
                onPressed: () {
                  // 검색 버튼을 눌렀을 때 수행할 작업
                },
              ),
              Text(
                '검색',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // 채팅 버튼
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.chat_bubble_outline_rounded),
                onPressed: () {
                  // 채팅 버튼을 눌렀을 때 수행할 작업
                },
              ),
              Text(
                '채팅',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // 마이페이지 버튼
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.person_outline),
                onPressed: () {
                  // 마이페이지 버튼을 눌렀을 때 수행할 작업
                },
              ),
              Text(
                '마이페이지',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
