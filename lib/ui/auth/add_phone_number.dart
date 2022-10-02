import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/ui/auth/verify_phone.dart';
import 'package:firebase_project/utls/utls.dart';
import 'package:flutter/material.dart';
import 'package:firebase_project/widget/button_widget.dart';


class AddPhoneNumber extends StatefulWidget {
  const AddPhoneNumber({Key? key}) : super(key: key);

  @override
  State<AddPhoneNumber> createState() => _AddPhoneNumberState();
}

class _AddPhoneNumberState extends State<AddPhoneNumber> {
  bool loading = false;
  final phoneNumberController = TextEditingController();
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
              controller: phoneNumberController,
              decoration: InputDecoration(
                hintText: 'Enter Your Phone Number',
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            ButtonWidget(
                loading: loading,
                onTap: (){
                  setState(() {
                    loading = true;
                  });
                  auth.verifyPhoneNumber(
                    phoneNumber: phoneNumberController.text,
                      verificationCompleted: (_){},
                      verificationFailed: (e){
                        setState(() {
                          loading = false;
                        });
                        utls().toastMessage(e.toString());
                      },
                      codeSent: (String verificationId,int? token){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifyPhone(verificationId: verificationId,)));
                      },
                      codeAutoRetrievalTimeout: (e){
                        setState(() {
                          loading = false;
                        });
                        utls().toastMessage(e.toString());
                      }
                  );
                },
                title: 'Get Code'),
          ],
        ),
      ),
    );
  }
}
