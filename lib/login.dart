import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _handleLogin() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    final url = Uri.parse('http://127.0.0.1:8000/accounts/login/');
    // Django API 엔드포인트를 여기에 입력

    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final message = jsonResponse['message'];

      if (message == 'Login successful') {
        // 로그인 성공 처리
        print('Logged in with Username: $username and Password: $password');
      } else {
        // 로그인 실패 처리
        print('Login failed. Please enter valid credentials.');
      }
    } else {
      // 서버로부터 200 상태 코드가 아닌 응답을 받았을 때의 처리
      print('Login request failed. Please try again.');
    }
  }
=======

void main() {
  runApp(const MaterialApp(home: LoginPage()));
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
>>>>>>> main

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        title: Text('Login'),
      ),
=======
>>>>>>> main
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
<<<<<<< HEAD
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'identify'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Login'),
=======
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
>>>>>>> main
            ),
          ],
        ),
      ),
    );
  }
}

<<<<<<< HEAD
void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  ));
=======
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
>>>>>>> main
}
