

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dating/controlers/auth_controler.dart';
import 'package:dating/model/user_model.dart';
import 'package:dating/utils/alert_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../screens/get_startedpage.dart';
import '../screens/home_page/home.dart';
import '../utils/util_functions.dart';

class User_Provider extends ChangeNotifier {

  final Auth_Controler _auth_controler = Auth_Controler();

  //------------initiallize user
  Future<void> initializeUser(BuildContext context) async{
    // check user's currently auth state
    //register this lisner
    await FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        //if the user object is null
        // can be user not sin in or sing out
        Logger().i("User is currently signed out!");
        UtilFunctions.naviagtePush(context, Get_Started_Page());
      } else {
        //if the user object is not null
        Logger().i("User is signed in!");
        await startFatchData(user.uid,context).then((value) {
          UtilFunctions.naviagtePush(context, const Home());
        });

      }
    });
  }

  //------------ store fatch user data
  User_Model? _user_Model;

  User_Model? get  userModel => _user_Model;


  //------start fatchinh user data
  Future<void> startFatchData(String uid,BuildContext context) async{
    try{
      await _auth_controler.fatchUserData(uid).then((value) {
        //---------------- check facth data not null
        if(value!=null){
          _user_Model=value;
          notifyListeners();
        }else{
          Alert_Helper.alertDialog(context, DialogType.error, "Error","Error while fatching user data");
        }
      });
    }catch(e){
      Logger().e(e);
    }
  }
}