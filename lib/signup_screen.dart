import 'package:flutter/material.dart';
//
//회원가입 기능
//아아디, 비밀번호, 이름, 전화번호 저장
//일반회원과 전문가를 구별하여 변수에 저장
//회원가입 버튼 누를시 -> 비밀번호 확인 기능
//

String id = " "; //아이디 저장 변수
String password = " "; // 비밀번호를 저장할 변수
String confirmPassword = " "; // 비밀번호 확인을 저장할 변수
bool passwordMismatch = false; //비밀번호 확인
String name = " "; //이름 저장 변수
String phone = " "; //휴대폰번호 저장 변수
String? userRole = " "; //사용자 역할(일반회원 or 전문가)로 저장됨

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenPage createState() => _SignUpScreenPage();
}

class _SignUpScreenPage extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          //app상단(뒤로가기,로고)
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 50),
                child: Image.asset(
                  'title.png',
                  width: 140,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
        ),
        //앱바디
        //시작
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //아이디 입력
              const Text('아이디', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                onChanged: (value) {
                  id = value; // 입력한 아이디 변수에 저장
                },
              ),
              const SizedBox(height: 30),
              const Text('비밀번호', style: TextStyle(fontWeight: FontWeight.bold)),
              //비밀번호 입력
              TextFormField(
                obscureText: true,
                onChanged: (value) {
                  password = value; // 입력한 비밀번호 변수에 저장
                },
              ),
              const SizedBox(height: 30),
              //비밀번호 확인 입력
              const Text('비밀번호 확인',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                obscureText: true,
                onChanged: (value) {
                  confirmPassword = value; // 입력한 비밀번호 확인 변수에 저장
                },
              ),
              //이름 입력
              const SizedBox(height: 30),
              const Text('이름', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                onChanged: (value) {
                  name = value; // 입력한 이름 변수에 저장
                },
              ),
              const SizedBox(height: 30),
              //전화번호 입력
              const Text('전화번호', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                onChanged: (value) {
                  phone = value; // 입력한 전화번호 변수에 저장
                },
              ),
              const SizedBox(height: 30),

              const Text('사용자 역할',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  //일반회원 라디오 버튼
                  Radio(
                    activeColor: Colors.green,
                    value: "일반회원",
                    groupValue: userRole,
                    onChanged: (value) {
                      setState(() {
                        userRole = value; //회원역할에 일반회원으로 저장
                      });
                    },
                  ),
                  const Text('일반회원'),
                  const SizedBox(width: 40),
                  //전문가 라디오 버튼
                  Radio(
                    activeColor: Colors.green,
                    value: "전문가",
                    groupValue: userRole,
                    onChanged: (value) {
                      setState(() {
                        userRole = value; //회원역할에 전문가로 저장
                      });
                    },
                  ),
                  const Text('전문가'),
                ],
              ),
              const SizedBox(height: 30),
              //회원가입 버튼
              ElevatedButton(
                onPressed: () {
                  print(userRole);
                  if (password == confirmPassword) {
                    //비밀번호 검사
                    passwordMismatch = false;
                  } else {
                    passwordMismatch = true;
                  }
                  if (passwordMismatch) {
                    //비밀번호 다를 시 경고창
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('비밀번호 확인'),
                          content: const Text('비밀번호가 일치하지 않습니다.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('확인'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                child: const Text(
                  '회원 가입',
                ),
              ), //회원가입 버튼 끝
            ],
          ),
        ));
  }
}
