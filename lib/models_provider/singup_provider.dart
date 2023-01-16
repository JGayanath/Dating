

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dating/controlers/auth_controler.dart';
import 'package:dating/utils/alert_helper.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SingUp_Provider extends ChangeNotifier{

  final Auth_Controler auth_controler = Auth_Controler();

  //------email controler
  final _email = TextEditingController();
  //------ get email controler
  TextEditingController get emailContoler => _email;


  //------mobile number controler
  final _mobileNumber = TextEditingController();
  //------ get mobile number controler
  TextEditingController get mobileNumberContoler => _mobileNumber;


  //------password controler
  final _password = TextEditingController();
  //------ get password controler
  TextEditingController get passwordContoler => _password;

  // loading state
  bool _isLoader = false;

  //--- return loading state
  bool get isLoading => _isLoader;

  // set loading state
  set loader(bool value){
    _isLoader=value;
    notifyListeners();
  }


  Future<void> stratSingUp(BuildContext context) async {
    try{
      if(_email.text.endsWith(".com") && _password.text.length>8 && _mobileNumber.text.length>9){
        loader=true;

        await auth_controler.singUpUser(_email.text,_mobileNumber.text,_password.text,context);

        //-- after singup
        loader=false;
      } else if(_email.text.isEmpty && _mobileNumber.text.isEmpty && _password.text.isEmpty ){
        Alert_Helper.alertDialog(context, DialogType.error , "Validation Error", "Fill all the fields");
      } else if(_mobileNumber.text.length<10){
        Alert_Helper.alertDialog(context, DialogType.error , "Validation Error", "Incorrect mobile number");
      } else if(_password.text.length<=8){
        Alert_Helper.alertDialog(context, DialogType.error , "Validation Error", "Weak password");
      } else{
        Alert_Helper.alertDialog(context, DialogType.error , "Validation Error", "Wrong email");
      }
    }catch(e){
      Logger().e(e);
      //loader=false;
    }
  }


}