import 'package:eco_wave/CreateMeetingPage.dart';
import 'package:eco_wave/LoginPage.dart';
import 'package:eco_wave/MainNavigation.dart';
import 'package:eco_wave/MainPage.dart';
import 'package:eco_wave/MeetingDetailPage.dart';
import 'package:eco_wave/ModifyProfilePage.dart';
import 'package:eco_wave/MyPage.dart';
import 'package:eco_wave/ProfileSettingPage.dart';
import 'package:eco_wave/RegisterPage2.dart';
import 'package:eco_wave/RegisterPage3.dart';
import 'package:eco_wave/ResigterPage1.dart';
import 'package:eco_wave/SearchSettingPage.dart';
import 'package:eco_wave/SettingPage.dart';
import 'package:eco_wave/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "EcoWave",
      theme: ThemeData(
          backgroundColor: Colors.black26,

      ),
      home: LoginPage(),

      routes: <String, WidgetBuilder>{
        '/loginPage' : (BuildContext context) =>  LoginPage(),
        '/registerPage1' : (BuildContext context) => RegisterPage1(),
        '/registerPage2' : (BuildContext context) => RegisterPage2(),
        '/registerPage3' : (BuildContext context) => RegisterPage3(),
        '/profileSettingPage' : (BuildContext context) => ProfileSettingPage(),
        '/createMeetingPage' : (BuildContext context) => CreateMeetingPage(),
        '/settingPage' : (BuildContext context) => SettingPage(),
        '/searchSettingPage' : (BuildContext context) => SearchSettingPage(),
      },
    );
  }
}
