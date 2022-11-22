import 'package:eco_wave/LoginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "EcoWave",
      theme: ThemeData(
          backgroundColor: Colors.black26,

      ),
      home: LoginPage(),
    );
  }
}
