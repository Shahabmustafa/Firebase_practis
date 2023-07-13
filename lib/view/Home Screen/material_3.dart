


import 'package:flutter/material.dart';

class MaterialThree extends StatefulWidget {
  const MaterialThree({Key? key}) : super(key: key);

  @override
  State<MaterialThree> createState() => _MaterialThreeState();
}

class _MaterialThreeState extends State<MaterialThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Three'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: (){

                },
                child: Text('Elevated Button')
            ),
            TextButton(
                onPressed: (){},
                child: Text('Text Button'),
            ),
            OutlinedButton(onPressed: (){}, child: Text('Outlined Button'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){

          },
          label: Text("Extended Button"),
      ),
    );
  }
}
