import 'dart:async';
import 'package:flutter/material.dart';
import '../Home Screen/home_screen.dart';

class SplashServer{
  gotoHome(BuildContext context){
    Timer(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }
}