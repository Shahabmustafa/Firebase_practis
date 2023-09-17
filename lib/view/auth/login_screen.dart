import 'package:firebase_practis/utils/utils.dart';
import 'package:firebase_practis/view/auth/phone_login.dart';
import 'package:firebase_practis/view/auth/social_media_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/constom_button.dart';
import 'email_passord_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Login",),
                Tab(text: "Phone",),
                Tab(text: "Social Media",),
              ],
            ),
            title: Text("Login"),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              EmailPasswordLogin(),
              PhoneLogin(),
              SocialMediaLogin(),
            ],
          ),

        ),
      ),
    );
  }
}
