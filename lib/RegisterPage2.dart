import 'package:eco_wave/RegisterPage3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage2 extends StatefulWidget{
  @override
  _RegisterPage2 createState() => _RegisterPage2();
}

class _RegisterPage2 extends State<RegisterPage2>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.035),
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
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04),
              ),
              Text(
                "이메일 인증",
                style: TextStyle(
                    fontFamily: 'Plus_Jakarta_Sans',fontSize: 24, fontWeight: FontWeight.w700),
              ),
              certificationNumberField(),
              Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.039),),
              Text(
                "이메일로 보내드린 인증번호를 입력하여\n회원가입을 완료해주시기 바랍니다",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Plus_Jakarta_Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xff878787)
                ),
              ),
              Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.041),),
              certificationBtn(context)
            ],
          ),
        ),
      ),
    );
  }


  Widget certificationNumberField(){
    return Container(
        margin: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: SizedBox(
          child: TextField(
            style: TextStyle(fontFamily: 'Source_Sans_Pro'),
            decoration: InputDecoration(
              isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xffD6D6D6))),
                hintText: "인증번호",
                hintStyle: TextStyle(color: Color(0xff878787))
            ),
          ),
        )
    );
  }

  Widget certificationBtn(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.height * 0.06,
      child: ElevatedButton(
        onPressed: () {
          certificationBtnEvent();
        },
        child: Text(
          "인증하기",
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

  certificationBtnEvent(){
    Navigator.of(context).pushNamed('/registerPage3');


  }
}