import 'package:flutter/material.dart';
import 'package:pt_system/home/home.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Implement login logic here
            // For example, navigate to HomeScreen on successful login
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Text('로그인'),
        ),
      ),
    );
  }
}
