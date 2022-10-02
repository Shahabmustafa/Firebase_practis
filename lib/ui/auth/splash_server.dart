import 'dart:async';
import 'package:firebase_project/ui/auth/add_phone_number.dart';
import 'package:flutter/material.dart';

class SplashServer{
  void isLogin(BuildContext context){
    Timer(Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddPhoneNumber() ))
    );
  }
}