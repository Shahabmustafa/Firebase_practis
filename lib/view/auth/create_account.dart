import 'package:firebase_practis/view_model/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/constom_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final userName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      resizeToAvoidBottomInset: false, // here
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Sign up to Email & Password",
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
                      controller: userName,
                      decoration: InputDecoration(
                          hintText: "Enter UserName",
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
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        border: InputBorder.none,
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
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.visibility)
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
                      controller: confirmPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Confirm Password",
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.visibility)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  RoundedButton(
                    title: "sign up",
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
                      AuthController().isSignUp(context,userName.text,email.text,password.text);
                    },
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: RichText(
                  softWrap: true,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  textScaleFactor: 1,
                  text: TextSpan(
                      text: "Your Account has Already Create ",
                      style: GoogleFonts.acme(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: " Log In",
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
      ),
    );
  }
}
