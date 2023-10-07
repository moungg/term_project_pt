import 'package:flutter/material.dart';
import 'package:pt_system/login/login.dart';

class FirstMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Main')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          child: Text('회원가입'),
        ),
      ),
    );
  }
}
