import 'package:flutter/material.dart';
import 'package:flutter_application_1/wigits/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndText(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
          size: 10,
        )
      ],
    );
  }
}
