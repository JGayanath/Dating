import 'package:animate_do/animate_do.dart';
import 'package:dating/components/custom_text.dart';
import 'package:dating/controlers/auth_controler.dart';
import 'package:dating/models_provider/user_provider.dart';
import 'package:dating/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  Auth_Controler auth_controler = Auth_Controler();

  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(milliseconds: 3500),
      () {
        Provider.of<User_Provider>(context, listen: false)
            .initializeUser(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    @override
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 146,
                    height: 145,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFA5672).withOpacity(0.05),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffFA5672).withOpacity(0.05),
                            spreadRadius: 72.5,
                            blurRadius: 10.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Color(0xffFA5672).withOpacity(0.05),
                            spreadRadius: 154.5,
                            blurRadius: 10.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Color(0xffFA5672).withOpacity(0.05),
                            spreadRadius: 222.5,
                            blurRadius: 10.0,
                            offset: Offset(3.0, 3.0)),
                      ],
                    ),
                    child: FadeInDown(
                      child: Image.asset(AssetsPath.login_Image2),
                      delay: Duration(milliseconds: 1500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                FadeInUp(
                  child: Custom_Text(
                    "Find Your Soulmate",
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                  delay: Duration(milliseconds: 1500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
