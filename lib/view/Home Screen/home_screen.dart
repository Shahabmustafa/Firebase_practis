import 'package:firebase_practis/view/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/download.jpeg'),
          ),
          SizedBox(
            height: 30,
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Name'),
              subtitle: Text('Shahab Mustafa'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Father Name'),
              subtitle: Text('Ghulam Mustafa'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number'),
              subtitle: Text('+92311XXXXXXXX'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.location_pin),
              title: Text('Location'),
              subtitle: Text('Peshawar Pakistan'),
            ),
          ),
        ],
      ),
    );
  }
}
