import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera'),backgroundColor: Colors.lightBlue,),
      body: Center(child: Text('Camera',style: TextStyle(fontSize: 22),)),
    );
  }
}