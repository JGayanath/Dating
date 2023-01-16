

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UtilFunctions{
  static void naviagtePush(BuildContext context , Widget widget){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> widget));
  }

  static void navigatePop(BuildContext context){
    Navigator.pop(context);
  }

}