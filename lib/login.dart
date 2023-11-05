import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'loginjoin.dart';

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
    const loginUrl = 'http://127.0.0.1:8000/login'; // 로그인 요청을 보낼 URL

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
        child: SingleChildScrollView(
          // 스크롤 가능하도록 SingleChildScrollView 추가
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/title.png',
                width: 400,
                height: 400,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // 이 속성으로 가운데 정렬
                  mainAxisSize: MainAxisSize.min, // 이 속성으로 필요한 공간만 사용s
                  children: <Widget>[
                    Flexible(
                      // 로그인 버튼을 Expanded 위젯으로 감싸기
                      child: ElevatedButton(
                        onPressed: () {
                          loginUser(context);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 60), // 높이 설정
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text('로그인',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 16.0), // 버튼 사이의 간격
                    Flexible(
                      // 회원가입 버튼을 Expanded 위젯으로 감싸기
                      child: ElevatedButton(
                        onPressed: () {
                          // 회원가입 페이지로 이동
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RegisterPage()), // 'RegisterPage'는 회원가입 페이지의 위젯
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 60), // 높이 설정
                          backgroundColor: Colors.black, // 회원가입 버튼 색상 변경
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text('회원가입',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
