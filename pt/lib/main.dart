import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('HTTP Request Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              fetchData();
            },
            child: Text('Fetch Data'),
          ),
        ),
      ),
    );
  }
}

Future<void> fetchData() async {
  final response = await http.get(Uri.parse('https://example.com/api/data/'));
  if (response.statusCode == 200) {
    print('데이터: ${response.body}');
  } else {
    print('오류: ${response.statusCode}');
  }
}
