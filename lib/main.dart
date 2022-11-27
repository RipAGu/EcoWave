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
import 'package:eco_wave/SettingPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  logger.d("tsg");
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

      routes: <String, WidgetBuilder>{
        '/loginPage' : (BuildContext context) =>  LoginPage(),
        '/registerPage1' : (BuildContext context) => RegisterPage1(),
        '/registerPage2' : (BuildContext context) => RegisterPage2(),
        '/registerPage3' : (BuildContext context) => RegisterPage3(),
        '/profileSettingPage' : (BuildContext context) => ProfileSettingPage(),
        '/mainPage' : (BuildContext context) => MainPage(),
        '/mainNavigation' : (BuildContext context) => MainNavigation(),
        '/createMeetingPage' : (BuildContext context) => CreateMeetingPage(),
        '/myPage' : (BuildContext context) => MyPage(),
        '/modifyProfilePage' : (BuildContext context) => ModifyProfilePage(),
        '/settingPage' : (BuildContext context) => SettingPage(),
        '/meetingDetailPage' : (BuildContext context) => MeetingDetailPage(),



      },
    );
  }
}
