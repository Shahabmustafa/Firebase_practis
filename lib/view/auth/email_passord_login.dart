


import 'package:firebase_practis/view/auth/create_account.dart';
import 'package:firebase_practis/view_model/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/constom_button.dart';

class EmailPasswordLogin extends StatefulWidget {
  const EmailPasswordLogin({Key? key}) : super(key: key);

  @override
  State<EmailPasswordLogin> createState() => _EmailPasswordLoginState();
}

class _EmailPasswordLoginState extends State<EmailPasswordLogin> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      resizeToAvoidBottomInset: false, // here
      body: OrientationBuilder(
          builder: (context,orientation){
            if(orientation == Orientation.landscape){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Login to Email & Password",
                                style: GoogleFonts.acme(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                height: height * 0.1,
                                width: width * 0.5,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Enter Email",
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                height: height * 0.1,
                                width: width * 0.5,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Enter Password",
                                      border: InputBorder.none,
                                      suffixIcon: Icon(Icons.visibility)
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              RoundedButton(
                                title: "Log In",
                                height: height * 0.1,
                                width: width * 0.5,
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forget Password",
                            style: GoogleFonts.acme(
                              color: Colors.deepPurple,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Flexible(child: Divider()),
                                Text('OR'),
                                Flexible(child: Divider()),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          InkWell(
                            onTap: (){

                            },
                            child: RichText(
                              softWrap: true,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                              textScaleFactor: 1,
                              text: TextSpan(
                                  text: "Create Your Account ",
                                  style: GoogleFonts.acme(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " Sign In",
                                      style: GoogleFonts.acme(
                                        color: Colors.deepPurple,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Login to Email & Password",
                    style: GoogleFonts.acme(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: height * 0.06,
                            width: width * 1,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                  hintText: "Enter Email",
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: height * 0.06,
                            width: width * 1,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextFormField(
                              controller: password,
                              decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  border: InputBorder.none,
                                  suffixIcon: Icon(Icons.visibility)
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          RoundedButton(
                            title: "Log In",
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
                            onTap: (){
                              AuthController().isLogin(context,email.text,password.text);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Forget Password",
                        style: GoogleFonts.acme(
                          color: Colors.deepPurple,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Flexible(child: Divider()),
                            Text('OR'),
                            Flexible(child: Divider()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount()));
                        },
                        child: RichText(
                          softWrap: true,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          textScaleFactor: 1,
                          text: TextSpan(
                              text: "Create Your Account ",
                              style: GoogleFonts.acme(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: " Sign In",
                                  style: GoogleFonts.acme(
                                    color: Colors.deepPurple,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          }
      ),
    );
  }
}
