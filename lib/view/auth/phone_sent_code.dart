import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practis/Model/user_model.dart';
import 'package:firebase_practis/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/constom_button.dart';

class PhoneVerificationCode extends StatefulWidget {
  PhoneVerificationCode({Key? key,required this.verificationId}) : super(key: key);
  String verificationId;
  @override
  State<PhoneVerificationCode> createState() => _PhoneVerificationCodeState();
}

class _PhoneVerificationCodeState extends State<PhoneVerificationCode> {
  final codeDigits = TextEditingController();
  final auth = FirebaseAuth.instance;
  final firebase = FirebaseFirestore.instance.collection('user');

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Column(
                children: [
                  Text("Please Enter Six Digits",
                    style: GoogleFonts.acme(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      controller: codeDigits,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter Phone Number",
                        border: OutlineInputBorder(),
                      ),
                      maxLength: 6,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  RoundedButton(
                    title: "Check",
                    height: height * 0.06,
                    width: width * 1,
                    textStyle: GoogleFonts.acme(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.deepPurple.shade500,
                    ),
                    icon: Icons.arrow_forward_ios,
                    onTap: ()async{
                      final credential = PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: codeDigits.text.toString()
                      );
                      try{
                        await auth.signInWithCredential(credential).then((value){
                          UserModel userModel = UserModel(
                            userName: value.user!.displayName,
                            email: value.user!.email,
                            profileImage: "",
                            uid: value.user!.uid,
                          );
                          firebase.doc(auth.currentUser!.uid).set(userModel.toJson());
                        });
                      }catch(e){
                        Utils().toastMessage(context, e.toString());
                        print(e.toString());
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
