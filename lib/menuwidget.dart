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
      selectedItemColor: Colors.blue, // 선택된 아이템의 색상을 파란색으로 설정
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Matching',
        ),
      ],
    );
  }
}
