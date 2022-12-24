import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eco_wave/RegisterPage3.dart';
import 'package:eco_wave/RestClient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage2 extends StatefulWidget{
  @override
  _RegisterPage2 createState() => _RegisterPage2();
}

class _RegisterPage2 extends State<RegisterPage2>{
  String? email;
  String? password;
  String? certificationNumber;
  static final _userCertificationNumber = TextEditingController();
  late RestClient client;



  @override
  void didChangeDependencies(){
    super.didChangeDependencies();

    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    if(arguments != null){
      email = arguments["email"] as String;
      password = arguments["password"] as String;
      certificationNumber = arguments["certificationNumber"] as String;
    }

    log(email.toString() + password.toString() + certificationNumber.toString());
  }

  @override
  void initState(){
    super.initState();
    Dio dio = Dio();
    client = RestClient(dio);
  }

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
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xffD6D6D6)),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: SizedBox(
          child: TextField(
            controller: _userCertificationNumber,
            style: TextStyle(fontFamily: 'Source_Sans_Pro'),
            decoration: InputDecoration(
              isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                border: InputBorder.none,
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
          "인증 및 가입",
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
    log(certificationNumber.toString() + "  " + _userCertificationNumber.text);
    if(certificationNumber == _userCertificationNumber.text){
      certification();

    }



  }

  void certification() async{
    RegisterRequest registerRequest  = RegisterRequest(email: email, pw: password);
    var posResponse = await client.getRegisterResponse(registerRequest);
    log(posResponse.success.toString());
    if(posResponse.success == true){
      Navigator.of(context).pushNamed('/registerPage3');

    }
    else{
      yes(posResponse.message.toString());
    }
  }

  Future yes(String msg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(msg,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Plus_Jakarta_Sans',
                  fontSize: 20),
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);

                },
                child: Text(
                  '네',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        });
  }
}