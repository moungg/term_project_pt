import 'package:flutter/material.dart';
import 'package:pt_system/first_main/first_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstMainScreen(),
    );
  }
}
