import 'package:flutter/material.dart';

class MatchingCompletePage extends StatefulWidget {
  const MatchingCompletePage({super.key});

  @override
  _MatchingCompletePageState createState() => _MatchingCompletePageState();
}

class _MatchingCompletePageState extends State<MatchingCompletePage> {
  // TODO: API에서 가져온 데이터를 사용하려면 fetchExperts 함수를 여기에 추가하십시오.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Matching Complete"),
      ),
      body: ListView.builder(
        itemCount: 10, // TODO: 실제 데이터의 길이로 변경해주세요
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Expert $index"), // TODO: 실제 데이터로 변경해주세요
            subtitle: Text("Location $index"), // TODO: 실제 데이터로 변경해주세요
          );
        },
      ),
    );
  }
}