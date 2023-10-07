import 'package:flutter/material.dart';
import './BottomNav.dart';
import './ButtonC.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white, // 앱의 상단 앱 바와 기본 색상
        scaffoldBackgroundColor: Colors.white, // 앱의 전체 배경색
      ),
      home: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: Colors.white,
            title: Image.asset(
              'logo1.png',
              width: 100,
              height: 25,
              fit: BoxFit.cover,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.black),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person_3_outlined, color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0), // 원하는 가로 마진 값을 지정
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 119, 197, 122)),
                  ),
                  onPressed: () {},
                  child: Text('회원가입',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
          body:
              //Coulm0
              Column(
            children: [
              //body menu바
              Container(
                margin: EdgeInsets.all(20),
                child: Row(children: [
                  ColorChangingButton(
                    buttonText: "오늘의 운동",
                  ), //ButtonC.dart에 만들어둔 버튼함수 누르면 색 회색으로 변경
                  ColorChangingButton(
                    buttonText: "오늘의 식단",
                  ),
                  ColorChangingButton(
                    buttonText: "캘린더",
                  ),
                ]),
              ),
              //오늘의 운동
              Container(
                //column1
                margin: EdgeInsets.fromLTRB(80, 40, 40, 0),
                child: Column(children: [
                  Text(
                    "오늘의 운동",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  //Row1
                  Row(children: [
                    Flexible(
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "종목",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text("reps",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                Text("set",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                Text("checkBox",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ]),
                        ],
                      ),
                      flex: 7,
                    ),
                    //차트
                    Flexible(
                      child: Align(
                        alignment: Alignment.center, // 부모의 가운데로 정렬
                      ),
                      flex: 3,
                    )
                  ]),
                ]),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationButtons()),
    );
  }
}
