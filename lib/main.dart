import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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

  // 각 탭에 대한 페이지 위젯을 정의합니다.
  final List<Widget> _pages = [
    TabPage(title: '탭 1'),
    TabPage(title: '탭 2'),
    TabPage(title: '탭 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메인 탭 예제'),
        actions: [
          IconButton(
            icon: Icon(Icons.category),
            onPressed: () {
              // 카테고리 버튼을 눌렀을 때 실행할 동작을 추가하세요.
              // 예를 들어, 카테고리 메뉴를 표시하거나 다른 작업을 수행할 수 있습니다.
              // 여기에 코드를 추가하세요.
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '탭 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '탭 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '탭 3',
          ),
        ],
      ),
    );
  }
}

class TabPage extends StatelessWidget {
  final String title;

  const TabPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
