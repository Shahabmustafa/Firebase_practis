import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practis/utils/utils.dart';
import 'package:firebase_practis/view/home_screen.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  bool cancelResendEmail = false;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isEmailVerified){
      sendVerificationEmail();
      timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }
  Future sendVerificationEmail()async{
    try{
      final user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      setState(() => cancelResendEmail = false,
      );
      await Future.delayed(Duration(seconds: 3));
      setState(() => cancelResendEmail = true,);
    }catch(e){
      Utils().toastMessage(context, e.toString());
    }
  }
  @override
  void dispose(){
   timer?.cancel();
   super.dispose();
  }
  Future checkEmailVerified()async{
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if(isEmailVerified)timer?.cancel();
  }
  Widget build(BuildContext context) {
    return isEmailVerified ? HomePage() : Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("A Verification Email has been sent to your email")),
          SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            onPressed: cancelResendEmail ? sendVerificationEmail : null,
            label: Text("Resent Email"),
            icon: Icon(Icons.message),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            child: Text("Cancel"),
          )
        ],
      ),
    );
  }
}
