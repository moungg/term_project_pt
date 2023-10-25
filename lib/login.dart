import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';


void main() {
  runApp(MaterialApp(home: LoginPage()));
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _handleLogin(BuildContext context) async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    final url = Uri.parse('http://localhost:8000/api/login/');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // 로그인 성공 시에 화면을 전환합니다.
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>const MyHomePage()));
    } else {
      print('Login failed. Please enter valid credentials.');
      // 실패 시 사용자에게 에러 메시지를 표시하는 코드를 추가할 수 있습니다.
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
              controller: _usernameController,
            ),
            const SizedBox(height: 16.0),
            RoundedTextField(
              label: '패스워드',
              isPassword: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _handleLogin(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
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

  const RoundedTextField(
      {Key? key,
      required this.label,
      required this.isPassword,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
