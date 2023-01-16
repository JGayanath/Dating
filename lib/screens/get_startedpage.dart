import 'package:dating/components/custom_button.dart';
import 'package:dating/components/custom_text.dart';
import 'package:dating/screens/login_page.dart';
import 'package:dating/utils/assets_path.dart';
import 'package:dating/utils/util_functions.dart';
import 'package:flutter/material.dart';

class Get_Started_Page extends StatefulWidget {
  const Get_Started_Page({Key? key}) : super(key: key);

  @override
  State<Get_Started_Page> createState() => _Get_Started_PageState();
}

class _Get_Started_PageState extends State<Get_Started_Page> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 487,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Positioned(
                      top: 262,
                      left: 51,
                      right: 307,
                      child: Container(
                        width: 11,
                        height: 11,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffFA5672).withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 85,
                      left: 132,
                      right: 232,
                      child: Container(
                        width: 11,
                        height: 11,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffFA5672).withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 330,
                      left: 37,
                      right: 276,
                      child: Image.asset(
                        AssetsPath.person4,width: 62,height: 62,),
                    ),
                    Positioned(
                      top: 294,
                      left: 244,
                      right: 14,
                      child: Image.asset(
                      AssetsPath.person5,width: 117,height: 117,),
                    ),
                    Positioned(
                      top: 91,
                      left: 261,
                      right: 31,
                      child: Image.asset(
                      AssetsPath.person3,width: 83,height: 83,),
                    ),
                    Positioned(
                      top: 107,
                      left: 27,
                      right: 264,
                      child: Image.asset(
                          AssetsPath.person2,width: 86,height: 86,),
                    ),
                    Positioned(
                      top: 170,
                      left: 87,
                      right: 87,
                      child: Center(
                        child: Container(
                          width: 201,
                          height: 201,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffFA5672).withOpacity(0.15),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffFA5672).withOpacity(0.13),
                                  spreadRadius: 71.0,
                                  blurRadius: 10.0,
                                  offset: Offset(3.0, 3.0),
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(AssetsPath.person1),
                                fit: BoxFit.fill,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 28, right: 28, bottom: 79),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Custom_Text(
                        "Let’s get closer ☺",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 319,
                        height: 129,
                        child: Custom_Text(
                          "The best place to meet your future partner.",
                          fontWeight: FontWeight.w700,
                          fontSize: 36,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Custom_Button(
                        text: "Get Started",
                        onTap: () {
                          UtilFunctions.naviagtePush(context, Login_Page());
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
