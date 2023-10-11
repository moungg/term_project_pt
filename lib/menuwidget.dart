import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onMenuItemTapped;

  MenuWidget({required this.currentIndex, required this.onMenuItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onMenuItemTapped,
      currentIndex: currentIndex,
      selectedItemColor: Colors.white, // 선택된 아이템의 색상을 파란색으로 설정

      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Calendar',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Matching',
          backgroundColor: Colors.black,
        ),
      ],
    );
  }
}
