import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String title;
  VoidCallback onTap;
  final bool loading;

  ButtonWidget({required this.onTap,required this.title,this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.teal,
        ),
        child: Center(child: loading ? CircularProgressIndicator(strokeWidth: 3, color: Colors.white,) : Text(title,style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}
