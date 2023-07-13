

import 'package:firebase_practis/view/Home%20Screen/material_3.dart';
import 'package:firebase_practis/view/Splash%20Screen/splash_screen.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(100),
                child: Image.asset('images/download.jpeg')),
              currentAccountPictureSize: Size.square(70),
              accountName: Text("Shahab Mustafa"),
              accountEmail: Text("shahabmustafa57@gmail.com"),
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SplashPage()));
            },
          ),
          ListTile(
            title: Text('Material Three'),
            leading: Icon(Icons.radio_button_checked),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialThree()));
            },
          ),
        ],
      ),
    );
  }
}
