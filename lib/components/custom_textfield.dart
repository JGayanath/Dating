import 'package:flutter/material.dart';

class Custom_TextField extends StatelessWidget {
  const Custom_TextField({
    Key? key,
    required this.controller,
    this.isObscure=false,
    this.textInputType=TextInputType.text,
  }):super(key: key);

  final TextEditingController controller;
  final bool isObscure;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8,right: 8),
        decoration: BoxDecoration(
          color: Color(0xffF0F0F0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: TextField(
          keyboardType: textInputType,
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffF0F0F0)),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffF0F0F0)),
              borderRadius: BorderRadius.circular(
                  10), //------------------------------------------------------------------------------------------------
            ),
          ),
        ));
  }
}
