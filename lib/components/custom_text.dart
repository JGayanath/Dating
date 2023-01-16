
import 'package:flutter/material.dart';

class Custom_Text extends StatelessWidget {
  Custom_Text(this.text,{
    this.color=Colors.black,
    this.fontWeight=FontWeight.w400,
    this.fontSize=16,
    this.textAlign=TextAlign.center,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}
