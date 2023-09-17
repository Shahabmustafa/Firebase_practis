


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practis/Model/user_model.dart';
import 'package:firebase_practis/view/home_screen.dart';
import 'package:firebase_practis/widgets/social_media_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view_model/auth/social_auth/facebook_auth.dart';
import '../../view_model/auth/social_auth/google_auth.dart';

class SocialMediaLogin extends StatefulWidget {
  const SocialMediaLogin({Key? key}) : super(key: key);

  @override
  State<SocialMediaLogin> createState() => _SocialMediaLoginState();
}

class _SocialMediaLoginState extends State<SocialMediaLogin> {
  final firestore = FirebaseFirestore.instance.collection('user');
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: OrientationBuilder(
        builder: (context,orientation){
          if(orientation == Orientation.portrait){
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Sign Up to Social Media",
                  style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton(
                      title: "Sign in Google",
                      imageURl: "google.png",
                      height: height * 0.05,
                      width: width * 1,
                      onTap: (){
                        signInWithGoogle().then((value){
                          UserModel userModel = UserModel(
                            uid: value.user!.uid,
                            email: value.user!.email,
                            profileImage: value.user!.photoURL,
                            userName: value.user!.displayName,
                          );
                          firestore.doc(auth.currentUser!.uid).set(userModel.toJson());
                        });
                      },
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    SocialMediaButton(
                      title: "Sign in Facebook",
                      imageURl: "facebook.png",
                      height: height * 0.05,
                      width: width * 1,
                      onTap: (){
                        signInWithFacebook().then((value){
                          UserModel userModel = UserModel(
                            userName: value.user!.displayName,
                            uid: value.user!.uid,
                            profileImage: value.user!.photoURL,
                            email: value.user!.email,
                          );
                          firestore.doc(auth.currentUser!.uid).set(userModel.toJson());
                          Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                        });
                      },
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    SocialMediaButton(
                      title: "Sign in Twitter",
                      imageURl: "twitter.png",
                      height: height * 0.05,
                      width: width * 1,
                      onTap: (){

                      },
                    ),
                  ],
                ),
              ],
            );
          }else{
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Sign Up to Social Media",
                    style: GoogleFonts.acme(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaButton(
                        title: "Sign in Google",
                        imageURl: "google.png",
                        height: height * 0.1,
                        width: width * 0.35,
                        onTap: (){

                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SocialMediaButton(
                        title: "Sign in Facebook",
                        imageURl: "facebook.png",
                        height: height * 0.1,
                        width: width * 0.35,
                        onTap: (){

                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SocialMediaButton(
                        title: "Sign in Twitter",
                        imageURl: "twitter.png",
                        height: height * 0.1,
                        width: width * 0.35,
                        onTap: (){

                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      )
    );
  }
}
