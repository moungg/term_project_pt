import 'package:flutter/material.dart';

class ColorChangingButton extends StatefulWidget {
  final String buttonText; // 버튼 텍스트
  ColorChangingButton({required this.buttonText});

  @override
  _ColorChangingButtonState createState() => _ColorChangingButtonState();
}

class _ColorChangingButtonState extends State<ColorChangingButton> {
  Color textColor = Colors.black; // 초기 텍스트 색상

  void _changeTextColor() {
    setState(() {
      // 텍스트 색상 변경
      textColor = textColor == Colors.black ? Colors.grey : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _changeTextColor,
      child: Container(
        width: 100.0,
        height: 40.0,
        color: Colors.white, // 배경색
        child: Center(
          child: Text(
            widget.buttonText, // 버튼 텍스트 설정
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor, // 텍스트 색상 변경
            ),
          ),
        ),
      ),
    );
  }
}
