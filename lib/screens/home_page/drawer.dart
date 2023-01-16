
import 'package:dating/components/custom_text.dart';
import 'package:dating/controlers/auth_controler.dart';
import 'package:dating/models_provider/user_provider.dart';
import 'package:dating/utils/colors.dart';
import 'package:dating/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Drawer_Page extends StatelessWidget {
  const Drawer_Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10.0,
      child: ListView(
        children: [
          SizedBox(
            height: 225,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  color: AppColors.appColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  CircleAvatar(
                    backgroundImage:NetworkImage('https://media.licdn.com/dms/image/D5603AQEtRqLUmKbH_Q/profile-displayphoto-shrink_800_800/0/1667525906093?e=1679529600&v=beta&t=B3mFp_YAP9bugXpNriP6hZzeu9g2tldJEwIMSh7noJU'),
                    radius: 40.0,
                  ),
                  SizedBox(height: 10.0),
                  Consumer<User_Provider>(builder: (context,value,child) {
                    return Custom_Text(
                      "${value.userModel?.uid}",fontSize: 15,color: Colors.white,);
                  }),
                  SizedBox(height: 10.0),
                  Consumer<User_Provider>(builder: (context,value,child) {
                    return Custom_Text(
                        "${value.userModel?.email}",color: Colors.white,fontSize: 15);
                  }),
                  SizedBox(height: 10.0),
                  Consumer<User_Provider>(builder: (context,value,child) {
                    return Custom_Text(
                      "${value.userModel?.mobileNumber}",fontSize: 15,color: Colors.white,);
                  }),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ),

          //Here you place your menu items
          ListTile(
            leading: Icon(Icons.home,color: AppColors.appColor,),
            title: Custom_Text('Home Page', fontSize: 18,textAlign: TextAlign.left,),
            onTap: () {
              // Here you can give your navigate
              UtilFunctions.navigatePop(context);

            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.settings,color: AppColors.appColor,),
            title: Custom_Text('Settings', fontSize: 18,textAlign: TextAlign.left,),
            onTap: () {
              // Here you can give your navigate
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.close,color: AppColors.appColor,),
            title: Custom_Text('Close Drawer',fontSize: 18,textAlign: TextAlign.left,),
            onTap: () {
              // Here you can give your navigate
              UtilFunctions.navigatePop(context);
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.logout,color: AppColors.appColor,),
            title: Custom_Text('Sing Out',fontSize: 18,textAlign: TextAlign.left,color: Colors.redAccent.shade700,),
            onTap: () {
              //---- user sing out
              Auth_Controler.sing_OutUser();
            },
          ),
          Divider(height: 3.0),
        ],
      ),
    );
  }
}
