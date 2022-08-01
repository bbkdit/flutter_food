import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  double size;
  double height;
  SmallText(
      {Key? key,
      required this.text,
      this.color = const Color(0xFF892d2b),
      this.size = 15,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400),
    );
  }
}
