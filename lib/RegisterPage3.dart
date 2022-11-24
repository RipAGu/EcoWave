import 'package:eco_wave/ProfileSettingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage3 extends StatefulWidget{
  @override
  _RegisterPage3 createState() => _RegisterPage3();
}

class _RegisterPage3 extends State<RegisterPage3>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.035),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgPicture.asset(
                  'assets/icons/mini_logo.svg',
                  semanticsLabel: "Flip",
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
            ),
            Text(
              "축하드립니다\n회원가입이 완료되었습니다\n\n이제 프로필을 완성해보세요:D",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Plus_Jakarta_Sans',fontSize: 25, fontWeight: FontWeight.w700),
            ),
            Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.041),),
            settingBtn(context)


          ],
        ),
      ),
    );
  }

  Widget settingBtn(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.height * 0.06,
      child: ElevatedButton(
        onPressed: () {
          settingBtnEvent();
        },
        child: Text(
          "설정하기",
          style: TextStyle(
              fontFamily: 'Source_Sans_Pro', fontSize: 20, fontWeight: FontWeight.w700),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff00A1E9),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0))),
      ),
    );
  }

  settingBtnEvent(){

    Navigator.of(context).pushNamedAndRemoveUntil('/profileSettingPage', ModalRoute.withName('/loginPage'));


  }
}