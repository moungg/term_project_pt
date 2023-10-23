import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleRegistration() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // TODO: Handle the registration logic
    // You can add your registration logic here

    // Example: Check if both username and password are not empty
    if (username.isNotEmpty && password.isNotEmpty) {
      // Successful registration, you can navigate to the main screen or perform other actions
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => MainScreen(),
      // ));
      print('Registered with Username: $username and Password: $password');
    } else {
      // Show an error message or perform other actions for unsuccessful registration
      print('Registration failed. Please enter both username and password.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true, // Hide the password text
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleRegistration,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
