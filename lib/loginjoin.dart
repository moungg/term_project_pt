// 'loginjoin.dart' 파일

import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
              RoundedTextField(
                label: '패스워드 확인',
                isPassword: true,
                controller: confirmPasswordController,
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  // 여기에 회원가입 로직을 구현
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 60),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child:
                    const Text('가입하기', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// RoundedTextField 위젯은 이전과 동일하게 사용
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
