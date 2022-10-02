import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/utls/utls.dart';
import 'package:flutter/material.dart';

import '../../widget/button_widget.dart';
import 'home_page.dart';


class VerifyPhone extends StatefulWidget {
  final String verificationId;
  VerifyPhone({required this.verificationId});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {

  bool loading = false;
  final verifyPhoneNumber = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            TextFormField(
              controller: verifyPhoneNumber,
              decoration: InputDecoration(
                hintText: '6 Digit code',
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            ButtonWidget(
              loading: loading,
                onTap: ()async{
                setState(() {
                  loading = true;
                });
                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: verifyPhoneNumber.text.toString()
                );
                try{
                  await auth.signInWithCredential(credential);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                }catch(e){
                  setState(() {
                    loading = false;
                  });
                  utls().toastMessage(e.toString());
                }

                },
                title: 'Login '),
          ],
        ),
      ),
    );
  }
}
