
import 'package:firebase_practis/view/Splash%20Screen/splash_service.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashServer server = SplashServer();
    server.gotoHome(context);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("SPLASH SCREEN",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),)),
        ],
      ),
    );
  }
}
