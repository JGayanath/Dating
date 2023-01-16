import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.home,
          size: 40,
          color: AppColors.appColor,
        ),
        Icon(
          Icons.mail_outline_outlined,
          size: 40,
          color: AppColors.outLineColor,
        ),
        Icon(
          Icons.notifications,
          size: 40,
          color: AppColors.outLineColor,
        ),
        Icon(
          Icons.favorite_outline_outlined,
          size: 40,
          color: AppColors.outLineColor,
        ),
      ],
    );
  }
}