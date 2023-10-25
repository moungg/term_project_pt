import 'package:flutter/material.dart';
import 'matching_complete.dart';

class MatchingPage extends StatelessWidget {
  const MatchingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // AppBar를 null로 설정하여 없앨 수 있습니다.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/title.png',

              width: 300, // 이미지의 너비를 조정합니다.
              height: 300, // 이미지의 높이를 조정합니다.
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MatchingCompletePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // 버튼의 배경색을 검은색으로 설정합니다.
                minimumSize: const Size(200, 50), // 버튼의 최소 크기를 조정합니다.
              ),
              child: const Text(
                "Matching",
                style: TextStyle(
                  color: Colors.white, // 버튼 텍스트 색상을 흰색으로 설정합니다.
                  fontSize: 18, // 버튼 텍스트 크기를 조정합니다.
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
