import 'dart:developer';

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:eco_wave/MainPage.dart';
import 'package:eco_wave/MyPage.dart';
import 'package:eco_wave/ProfileSettingPage.dart';
import 'package:eco_wave/RegisterPage2.dart';
import 'package:eco_wave/ResigterPage1.dart';
import 'package:eco_wave/common/my_flutter_app_icons.dart';
import 'package:eco_wave/test.dart';
import 'package:eco_wave/test2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget{
  String? token;
  MainNavigation(String token){
    this.token = token;
  }
  @override
  _MainNavigation createState() => _MainNavigation(token!);
}

class _MainNavigation extends State<MainNavigation>{
  int _currentIndex = 0;
  String? token;
  _MainNavigation(String token){
    this.token = token;
  }


  @override
  Widget build(BuildContext context){
    var _children = [MainPage(token!), MainPage(token!), MyPage()];

    return Scaffold(
      body: IndexedStack(
        children: <Widget>[_children[_currentIndex],],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          paddingR: EdgeInsets.all(10),
          marginR: EdgeInsets.only(left: 30, right: 30),
          currentIndex: _currentIndex,
          unselectedItemColor: Color(0xffB9D4DC),
          onTap: _handleIndexChanged,
          enablePaddingAnimation: false,
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2), // changes position of shadow
          ),],
          items: [
            DotNavigationBarItem(
              icon: Icon(CustomIcons.house),
              selectedColor: Color(0xff30B2ED),
            ),

            DotNavigationBarItem(
              icon: Icon(CustomIcons.frame_1),
              selectedColor: Color(0xff30B2ED),
            ),

            DotNavigationBarItem(
              icon: Icon(CustomIcons.human),
              selectedColor: Color(0xff30B2ED),
            ),
          ],
        ),
      ),
    );
  }
  void _handleIndexChanged(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

}