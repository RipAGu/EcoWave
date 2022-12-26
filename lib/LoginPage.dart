import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eco_wave/ResigterPage1.dart';
import 'package:eco_wave/RestClient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MainNavigation.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late RestClient client;
  final formKey = GlobalKey<FormState>();
  static final _emailController = TextEditingController();
  static final _passwordController = TextEditingController();
  LoginRequest loginRequest = LoginRequest(email: 'test', pw: 'test');

  @override
  void initState(){
    super.initState();
    Dio dio = Dio();
    client = RestClient(dio);

    log('test');

    Future.microtask(() async{
      final resp = await client.getLoginData(loginRequest);
      log(resp.success.toString());
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LogoSection(),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text('Make a New Eco Wave',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Source_Sans_Pro',
                    fontSize: 30,
                    fontWeight: FontWeight.w700

                  )
              ),
            ),
            emailField(),
            pwField(),
            Container(
              margin: EdgeInsets.only(top: 30),
            ),
            loginBtn(context),
            Container(
              padding: EdgeInsets.only(left: 90,right: 90),
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Image(image: AssetImage('assets/icons/kakaotalk.png'),
                    width: MediaQuery.of(context).size.width * 0.096,
                    ),
                  Image(image: AssetImage('assets/icons/naver.png'),
                      width: MediaQuery.of(context).size.width * 0.096
                  ),
                  Image(image: AssetImage('assets/icons/google.png'),
                      width: MediaQuery.of(context).size.width * 0.096
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                ),
                GestureDetector(
                  child: const Text(
                    "회원가입",
                    style: TextStyle(
                       fontFamily: 'Plus_Jakarta_Sans', fontSize: 14, color: Color(0xff878787)),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/registerPage1');
                  },
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                ),
                SizedBox(
                    width: 10,
                    child: Image(
                      image: AssetImage('assets/icons/line_1.png'),
                    )),
                Container(
                  margin: EdgeInsets.only(right: 10),
                ),
                GestureDetector(
                  child: Text(
                    "비밀번호 찾기",
                    style: TextStyle(
                       fontFamily: 'Plus_Jakarta_Sans', fontSize: 14, color: Color(0xff878787)),
                  ),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  Widget emailField() {
    return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.only(left: 80, right: 80),
        child: SizedBox(
          height: 40,
          child: TextField(
            style: TextStyle(fontFamily: 'Source_Sans_Pro'),
            controller: _emailController,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none)),
                filled: true,
                hintText: 'ID',
                hintStyle: TextStyle(
                  fontFamily: 'Source_Sans_Pro',
                  color: Color(0xff909090),
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
                fillColor: Color(0xffEFEFEF)),
            keyboardType: TextInputType.emailAddress,
          ),
        ));
  }

  Widget pwField() {
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 80, right: 80),
        child: SizedBox(
          height: 40,
          child: TextField(
            style: TextStyle(fontFamily: 'Source_Sans_Pro'),
            controller: _passwordController,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none)),
                filled: true,
                hintText: 'PW',
                hintStyle: TextStyle(
                  fontFamily: 'Source_Sans_Pro',
                  color: Color(0xff909090),
                  fontSize: 20,
                    fontWeight: FontWeight.w500

                ),
                fillColor: Color(0xffEFEFEF)),
            keyboardType: TextInputType.emailAddress,
          ),
        ));
  }
  
  void loginTest() async{
    LoginRequest loginRequest = LoginRequest(email: _emailController.text, pw: _passwordController.text);
    var posResponse = await client.getLoginData(loginRequest);

    if(posResponse.success == true){
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("token", posResponse.data!.token);
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainNavigation(posResponse.data!.token)));


    }

  }

  Widget loginBtn(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.height * 0.055,
      child: ElevatedButton(
        onPressed: () {
          if(_emailController.text == null){

          }
          loginBtnEvent();
        },
        child: Text(
          "Let's Plogging",
          style: TextStyle(
              fontFamily: 'Source_Sans_Pro',fontSize: 18, fontWeight: FontWeight.w700),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff00A1E9),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0))),
      ),
    );
  }

  loginBtnEvent(){
    if(_emailController.text == ''){
      yes('이메일을 입력해주세요');
    }
    else if(_passwordController.text == ''){
      yes('비밀번호를 입력해주세요');
    }
    else {
      loginTest();

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

class LogoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.13),
        decoration: const BoxDecoration(
            color: Color(0xff00A1E9),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.46,


          child: SvgPicture.asset(
            'assets/icons/logo.svg',
          ),





    );
  }




}
