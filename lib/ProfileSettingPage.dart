import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileSettingPage extends StatefulWidget{
  @override
  _ProfileSettingPage createState() => _ProfileSettingPage();
}

class _ProfileSettingPage extends State<ProfileSettingPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.037),),
            Text(
              "프로필 설정",
              style: TextStyle(
                fontFamily: 'Source_Sans_Pro',
                fontSize: 24,
                fontWeight: FontWeight.w700
              ),
            )

          ],
        ),
      ),
    );
  }
}