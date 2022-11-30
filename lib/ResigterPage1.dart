import 'package:eco_wave/RegisterPage2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage1 extends StatefulWidget {
  @override
  _RegisterPage1 createState() => _RegisterPage1();
}

class _RegisterPage1 extends State<RegisterPage1> {
  @override
  Widget build(BuildContext context) {
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

                  child: SvgPicture.asset(
                    'assets/icons/mini_logo.svg',
                    semanticsLabel: "Flip",
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04),
              ),
              Text(
                "회원가입",
                style: TextStyle(
                    fontFamily: 'Plus_Jakarta_Sans',fontSize: 25, fontWeight: FontWeight.w700),
              ),
              emailField(),
              pwField(),
              Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),),
              registerBtn(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 30),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xffD6D6D6)),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: SizedBox(
          child: TextField(
            style: TextStyle(fontFamily: 'Source_Sans_Pro'),
            decoration: InputDecoration(
                border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

            hintText: "이메일 주소",
            hintStyle: TextStyle(color: Color(0xff878787))),
      ),
    )
    );
  }

  Widget pwField(){
    return Container(
        margin: EdgeInsets.only(left: 30, right: 30, top: 30),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xffD6D6D6)),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: SizedBox(
          child: TextField(
            style: TextStyle(fontFamily: 'Source_Sans_Pro'),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

                hintText: "비밀번호",
                hintStyle: TextStyle(color: Color(0xff878787))),
          ),
        )
    );
  }

  Widget registerBtn(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.height * 0.06,
      child: ElevatedButton(
        onPressed: () {
          registerBtnEvent();
        },
        child: Text(
          "가입하기",
          style: TextStyle(fontFamily: 'Source_Sans_Pro', fontWeight: FontWeight.w700, fontSize: 20)
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff00A1E9),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0))),
      ),
    );
  }

  registerBtnEvent(){
    Navigator.of(context).pushNamed('/registerPage2');

  }
}
