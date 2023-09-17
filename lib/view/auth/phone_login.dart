import 'package:firebase_practis/view_model/auth/phone_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/constom_button.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Sign Up to Phone Number",
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
                      controller: phoneNumber,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Enter Phone Number",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
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
                    onTap: (){
                      PhoneController().isPhoneAuth(context,phoneNumber.text);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
