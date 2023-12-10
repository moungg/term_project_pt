import 'package:flutter/material.dart';
import 'package:pt_system/login.dart';
import 'package:pt_system/managePt_Trainer.dart';
import 'package:pt_system/manageTrainer.dart';

class trainer extends StatefulWidget {
  @override
  _trainer createState() => _trainer();
}

class _trainer extends State<trainer> {
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              '김승규 트레이너님 환영합니다.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => managePt_Trainer(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 100), // 버튼의 고정 크기 지정
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // 원하는 모서리 반지름 값을 설정하세요
                      ),
                    ),
                    child: const Text('회원 관리',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => manage_Trainer(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 100), // 버튼의 고정 크기 지정
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // 원하는 모서리 반지름 값을 설정하세요
                      ),
                    ),
                    child: const Text('매칭 요청 관리',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      //시작
    );
  }
}
