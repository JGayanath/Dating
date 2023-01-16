import 'package:dating/components/custom_button.dart';
import 'package:dating/components/custom_text.dart';
import 'package:dating/components/custom_textfield.dart';
import 'package:dating/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models_provider/singup_provider.dart';

class Register_Page extends StatefulWidget {
  const Register_Page({Key? key}) : super(key: key);

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    height: 182,
                    width: 255,
                    child: Image.asset(AssetsPath.eatingTogether),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Custom_Text(
                      "Register Here",
                      fontSize: 36,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 24,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Custom_Text(
                      "Enter your Email",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff5E5E5E),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Custom_TextField(controller: Provider.of<SingUp_Provider>(context).emailContoler,textInputType: TextInputType.emailAddress,),
                const SizedBox(
                  height: 12,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Custom_Text(
                      "Enter your mobile number",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff5E5E5E),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Custom_TextField(controller: Provider.of<SingUp_Provider>(context).mobileNumberContoler,textInputType: TextInputType.phone),
                const SizedBox(
                  height: 12,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Custom_Text(
                      "Enter your Password",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff5E5E5E),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Custom_TextField(controller: Provider.of<SingUp_Provider>(context).passwordContoler,isObscure: true),
                const SizedBox(
                  height: 19,
                ),
                Consumer<SingUp_Provider>(builder: (context , value , child) {
                  return Custom_Button(
                    loader: value.isLoading,
                      text: "Register",
                      onTap: () {
                        value.stratSingUp(context);
                      });
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
                            width: 0.5,
                          ),
                        ),
                        child: Image.asset(AssetsPath.iconGoogle,width: 24,height: 24,),
                    ),
                    Container(
                      width: 150,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          width: 0.5,
                          color: Color(0xff1976D2),
                        ),
                      ),
                      child: Image.asset(AssetsPath.iconFacebook,width: 24,height: 24,),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 55,
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
