import 'package:dating/components/custom_button.dart';
import 'package:dating/components/custom_text.dart';
import 'package:dating/components/custom_textfield.dart';
import 'package:dating/screens/forgot_password.dart';
import 'package:dating/screens/register_screen.dart';
import 'package:dating/utils/assets_path.dart';
import 'package:dating/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models_provider/singin_provider.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 139,
                          width: 155,
                          child: Image.asset(AssetsPath.login_Image2),
                        ),
                        Container(
                          width: 155,
                          child: Custom_Text(
                            "Login to a lovely life.",
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 3),
                          height: 321,
                          width: 187,
                          child: Image.asset(AssetsPath.login_Image1),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 39,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Custom_Text(
                      "Enter your Email",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff5E5E5E),
                    )),
                const SizedBox(
                  height: 4,
                ),
                Custom_TextField(controller: Provider.of<Singin_Provider>(context).emailController,textInputType: TextInputType.emailAddress,),
                const SizedBox(
                  height: 3,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Custom_Text(
                      "Enter your Password",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff5E5E5E),
                    )),
                const SizedBox(
                  height: 6,
                ),
                Custom_TextField(controller: Provider.of<Singin_Provider>(context).passwordlController,isObscure: true),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      UtilFunctions.naviagtePush(context, Forgot_Password());
                    },
                    child: Custom_Text(
                      "Trouble login?",
                      fontSize: 12,
                      color: Color(0xff5E5E5E),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Consumer<Singin_Provider>(builder: (context,value,child) {
                  return Custom_Button(
                    loader: value.isLoading,
                      onTap: () {
                        value.stratSingIn(context);
                      },text: "Login",);
                }
                ),
                const SizedBox(
                  height: 27,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 62,
                      child: Divider(
                        color: Colors.black,
                      )),
                  Custom_Text(
                    "Or",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff9D9D9D),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: 62,
                      child: Divider(
                        color: Colors.black,
                      )),
                ]),
                const SizedBox(
                  height: 27,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Color(0xffFF3D00),
                          width: 1,
                        ),
                      ),
                      child: Image.asset(
                        AssetsPath.iconGoogle,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          width: 1,
                          color: Color(0xff1976D2),
                        ),
                      ),
                      child: Image.asset(
                        AssetsPath.iconFacebook,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 23,
                ),
                TextButton(
                  onPressed: () {
                    UtilFunctions.naviagtePush(context, Register_Page());
                  },
                  child: Custom_Text(
                    "Don’t have an account?",
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Container(
                  margin: EdgeInsets.only(left: 48, right: 48),
                  child: Align(
                    alignment: Alignment.center,
                    child: Custom_Text(
                      fontWeight: FontWeight.w500,
                          "By continue to login, you accept our company’s Term & conditions and Privacy policies.",
                      fontSize: 12,
                      color: Color(0xffBBBBBB),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
