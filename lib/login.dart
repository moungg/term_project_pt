import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

void main() {
  runApp(MaterialApp(home: LoginPage()));
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser(BuildContext context) async {
    final username = usernameController.text;
    final password = passwordController.text;

    // 실제 서버 URL로 변경
    const loginUrl = 'http://localhost:8000/login'; // 로그인 요청을 보낼 URL
// 로그인 요청을 보낼 URL

    final response = await http.post(Uri.parse(loginUrl), body: {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      // 로그인 성공
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    } else {
      // 로그인 실패
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('로그인 실패'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/title.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 16.0),
            RoundedTextField(
              label: '아이디',
              isPassword: false,
              controller: usernameController,
            ),
            const SizedBox(height: 16.0),
            RoundedTextField(
              label: '패스워드',
              isPassword: true,
              controller: passwordController,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                loginUser(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // 원하는 모서리 반지름 값을 설정하세요
                ),
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
  final TextEditingController controller;

  const RoundedTextField({
    Key? key,
    required this.label,
    required this.isPassword,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // 옆면에 16.0의 패딩 추가
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
