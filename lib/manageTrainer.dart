import 'package:flutter/material.dart';
import 'package:pt_system/login.dart';

class manage_Trainer extends StatefulWidget {
  @override
  _manage_Trainer createState() => _manage_Trainer();
}

class _manage_Trainer extends State<manage_Trainer> {
  List<String> trainerMembers1 = [
    "이름 : 김규헌",
    "나이 : 24세",
    "성별 : 남",
    "거주지역 : 충남 아산시 신창면 순천향대학교"
  ];
  List<String> trainerMembers2 = [
    "이름 : 김병찬",
    "나이 : 34세",
    "성별 : 여",
    "거주지역 : 충남 아산시 신창면 순천향대학교"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '회원 리스트 1',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TrainerMembersList(trainerMembers1),
            SizedBox(height: 20),
            Text(
              '회원 리스트 2',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TrainerMembersList(trainerMembers2),
          ],
        ),
      ),
    );
  }
}

class TrainerMembersList extends StatelessWidget {
  final List<String> members;

  TrainerMembersList(this.members);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: members.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(members[index]),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('수락완료'),
                    content: const Text('매칭이 성공적으로 완료되었습니다.'),
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
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 0, 0, 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text('수락하기'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: manage_Trainer()));
}
