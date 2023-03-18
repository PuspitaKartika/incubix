import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : "Mentoring Beginner FLutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mentoring Beginner Flutter"),
        ),
        body: Center(
          child: Text("Hello world!", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.red
          ),),
        ),
      ),
    );
  }
}




