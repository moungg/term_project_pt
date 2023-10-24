import 'package:flutter/material.dart';

class PersonalChatPage extends StatefulWidget {
  final String userName; // 채팅 상대방의 이름

  const PersonalChatPage({super.key, required this.userName});

  @override
  _PersonalChatPageState createState() => _PersonalChatPageState();
}

class _PersonalChatPageState extends State<PersonalChatPage> {
  final List<String> messages = []; // 메시지 목록
  final TextEditingController messageController = TextEditingController();

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        messages.add(message);
      });
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName), // 상대방의 이름을 표시
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight, // 또는 Alignment.topLeft
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      color: Colors.blue, // 또는 다른 색상
                      child: Text(messages[index],
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(hintText: '메시지 입력'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(messageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
