import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: LoginPage()));
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Fit-T 이미지
            Image.asset(
              'assets/title.png', // 이미지 파일 경로
              width: 200, // 이미지의 가로 크기 조절
              height: 200, // 이미지의 세로 크기 조절
            ),
            const SizedBox(height: 16.0), // 간격 추가
            const RoundedTextField(label: '아이디', isPassword: false),
            const SizedBox(height: 16.0), // 간격 추가
            const RoundedTextField(label: '패스워드', isPassword: true),
            const SizedBox(height: 16.0), // 간격 추가
            ElevatedButton(
              onPressed: () {
                // 로그인 로직을 여기에 추가
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // 버튼의 배경색 (검은색)
              ),
              child: const Text('로그인', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedTextField extends StatelessWidget {
  final String label;
  final bool isPassword;

  const RoundedTextField(
      {super.key, required this.label, required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword, // 비밀번호 입력 필드인 경우 true로 설정
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide:
              const BorderSide(color: Colors.black), // 박스 모양을 둥근 형태로 만듭니다.
        ),
      ),
    );
  }
}
