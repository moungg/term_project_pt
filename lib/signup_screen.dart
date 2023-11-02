import 'package:flutter/material.dart';
import 'login.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          // title: Center(
          //   child: Image.asset(
          //     'title.png',
          //     width: 100,
          //     height: 40,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //     icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          //   ),
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.person_3_outlined, color: Colors.black),
          //   ),
          // ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'title.png',
                width: 100,
                height: 40,
                fit: BoxFit.cover,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('아이디'),
              TextFormField(
                  // 아이디 입력 폼
                  ),
              Text('비밀번호'),
              TextFormField(
                  // 비밀번호 입력 폼
                  ),
              Text('비밀번호 확인'),
              TextFormField(
                  // 비밀번호 확인 입력 폼
                  ),
              Text('이름'),
              TextFormField(
                  // 이름 입력 폼
                  ),
              Text('전화번호'),
              TextFormField(
                  // 전화번호 입력 폼
                  ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // 회원 가입 버튼 누를 때 수행할 동작 추가
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // 배경색을 흰색으로 설정
                ),
                child: Text(
                  '회원 가입',
                  style: TextStyle(color: Colors.black), // 텍스트 색상을 검은색으로 설정
                ),
              ),
            ],
          ),
        ));
  }
}
