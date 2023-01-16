
import 'package:dating/components/custom_text.dart';
import 'package:dating/utils/colors.dart';
import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {
  Custom_Button({
    required this.onTap,
    required this.text,
    this.loader=false,
    Key? key,
  }) : super(key: key);

  final String text;
  final Function() onTap;
  final bool loader;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: loader ? CircularProgressIndicator.adaptive(
          backgroundColor: Colors.white,
        ):Custom_Text(
          text,
          color: Colors.white,
        ),
      ),
    );
  }
}
