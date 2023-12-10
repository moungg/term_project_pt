import 'package:flutter/material.dart';
import 'package:pt_system/home.dart';
import 'package:pt_system/login.dart';

class managePt_Trainer extends StatefulWidget {
  @override
  _managePt_TrainerState createState() => _managePt_TrainerState();
}

class _managePt_TrainerState extends State<managePt_Trainer> {
  List<String> ptMembers1 = [
    "이름 : 김규헌",
    "나이 : 24세",
    "성별 : 남",
    "거주지역 : 충남 아산시 신창면 순천향대학교"
  ];
  List<String> ptMembers2 = [
    "이름 : 김병찬",
    "나이 : 34세",
    "성별 : 남",
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
              '회원 관리 리스트 1',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            PtMembersList(ptMembers1),
            SizedBox(height: 20),
            Text(
              '회원 관리 리스트 2',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            PtMembersList(ptMembers2),
          ],
        ),
      ),
    );
  }
}

class PtMembersList extends StatelessWidget {
  final List<String> members;

  PtMembersList(this.members);

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
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text('회원 관리', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: managePt_Trainer()));
}
