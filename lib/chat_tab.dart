import 'package:flutter/material.dart';
import 'ChatPage.dart';

class ChatTab extends StatefulWidget {
  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  // Define a list of users. You can replace this with your data.
  List<String> userList = ["User 1", "User 2", "User 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(userList[index]),
            onTap: () {
              // Navigate to the chat screen when a user is selected.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(user: userList[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
