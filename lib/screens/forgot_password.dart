import 'package:dating/components/custom_button.dart';
import 'package:dating/components/custom_text.dart';
import 'package:dating/components/custom_textfield.dart';

import 'package:dating/utils/assets_path.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models_provider/singin_provider.dart';

class Forgot_Password extends StatefulWidget {
  const Forgot_Password({Key? key}) : super(key: key);

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {

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
                    margin: const EdgeInsets.only(top: 102, bottom: 67),
                    height: 182,
                    width: 255,
                    child: Image.asset(AssetsPath.forgotPasswordPath),
                  ),
                ),
                Custom_Text(
                    "Trouble Log In?",
                    fontSize: 36,
                    fontWeight: FontWeight.w700),
                const SizedBox(
                  height: 18,
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
                Custom_TextField(controller:Provider.of<Singin_Provider>(context).resetpassworemailController,textInputType: TextInputType.emailAddress,),
                const SizedBox(
                  height: 17,
                ),
                Consumer<Singin_Provider>(builder: (context,value,child) {
                  return Custom_Button(
                    loader: value.isLoading,
                      text: "Send Reset Email",
                      onTap: () {
                        value.stratsendPasswordResetEmail(context);
                        //UtilFunctions.navigatePop(context);
                      });
                }),
                const SizedBox(
                  height: 155,
                ),
                Container(
                  margin: EdgeInsets.only(left: 48,right: 48),
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
                  height: 47,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
