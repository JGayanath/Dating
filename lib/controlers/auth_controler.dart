
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating/model/user_model.dart';
import 'package:dating/screens/login_page.dart';
import 'package:dating/utils/alert_helper.dart';
import 'package:dating/utils/util_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';



class Auth_Controler{
  // sing up user
  Future<void> singUpUser(String email , String phoneNumber,String password,BuildContext context) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //-------------- assing user data for save
      saveUserData(credential.user!.uid,email,phoneNumber,password);


      Logger().i(credential);
    } on FirebaseAuthException catch (e) {
      Logger().e(e.code);
      Alert_Helper.alertDialog(context, DialogType.error , "Error", e.code);

    } catch (e) {
      Alert_Helper.alertDialog(context, DialogType.error , "Error", e.toString());
      Logger().e(e);
    }
  }

  //-----------firestore referance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //-----------firestore user referance
  CollectionReference users = FirebaseFirestore.instance.collection('users');


  // save user data
  Future<void> saveUserData(String uid,String email, String mobileNumber , String password) {
    return users
        .doc(uid)
        .set({
      'email': email,
      'mobileNumber': mobileNumber,
      'password': password,
      'uid': uid,
    })
        .then((value) => Logger().i("User added"))
        .catchError((error) => Logger().e("Fail to added user : $error"));
  }

  //-----------fatch user data from cloud firestore
  Future<User_Model?> fatchUserData(String uid) async{
  try{
    //-------user data fatch according to the uid
    DocumentSnapshot documentSnapshot = await users.doc(uid).get();

    Logger().i(documentSnapshot.data());


    //-----------------mapping fatch user data in to usermodel
    User_Model user_model=User_Model.fronJson(documentSnapshot.data() as Map<String , dynamic>);
    return user_model;

  }catch(e){
    Logger().e(e);
    return null;
  }
  }


  // sign in up user
  static Future<void> signInUser(String email , String password,BuildContext context) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Logger().i(credential);
    } on FirebaseAuthException catch (e) {
      Logger().e(e.code);
      Alert_Helper.alertDialog(context, DialogType.error , "Error", e.code);
    } catch (e) {
      Logger().e(e);
      Alert_Helper.alertDialog(context, DialogType.error , "Error", e.toString());
    }
  }
  static Future<void> sendPasswordResetEmail(String email,BuildContext context) async{
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email:
      email,
      );
    } on FirebaseAuthException catch (e) {
      Logger().e(e.code);
      Alert_Helper.alertDialog(context, DialogType.error , "Error", e.code);
    } catch (e) {
      Logger().e(e);
      Alert_Helper.alertDialog(context, DialogType.error , "Error", e.toString());
    }
  }
  //-----sing out user
  static Future<void> sing_OutUser()async {
    await FirebaseAuth.instance.signOut();
  }
}

