import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home.dart'; // HomePage import 추가

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
  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
} else {
  print('Login failed. Please enter valid credentials.');
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
            const RoundedTextField(label: '아이디', isPassword: false),
            const SizedBox(height: 16.0),
            const RoundedTextField(label: '패스워드', isPassword: true),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _handleLogin(context); // _handleLogin 함수에 Build context 전달
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

  const RoundedTextField({Key? key, required this.label, required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
