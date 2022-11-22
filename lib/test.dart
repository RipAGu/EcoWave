import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
var logger = Logger(printer: PrettyPrinter(),);



class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  static final _emailController = TextEditingController();
  static final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[

            LogoSection(),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                  'Make a New Eco Wave',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  )
              ),
            ),
            IdInput("id", _emailController),
            Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(left: 80, right: 80),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    style: GoogleFonts.sourceSansPro(),
                    controller: _passwordController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none
                          )
                      ),
                      filled: true,
                      hintText: 'PW',
                      hintStyle: TextStyle(
                        color: Color(0xff909090),
                        fontSize: 25,
                      ),
                      fillColor: Color(0xffEFEFEF),
                    ),
                  ),
                )
            ),
            ButtonBar(
              children: <Widget>[
                ElevatedButton(onPressed: (){
                  _emailController.clear();
                  _passwordController.clear();

                }, child: Text('test'))
              ],
            )//pw입력창
          ],
        ),
      ),
    );
  }

  Widget emailField(){
    return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.only(left: 80, right: 80),
        child: SizedBox(
          height: 40,
          child: TextField(
            style: GoogleFonts.sourceSansPro(),
            controller: _emailController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none
                    )
                ),
                filled: true,
                hintText: 'test',
                hintStyle: TextStyle(
                  color: Color(0xff909090),
                  fontSize: 25,
                ),
                fillColor: Color(0xffEFEFEF)
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        )
    );
  }
}

class LogoSection extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
        decoration: const BoxDecoration(
            color: Color(0xff00A1E9),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.46,
        child: FittedBox(fit: BoxFit.scaleDown,
            child: SvgPicture.asset('assets/icons/logo.svg',
              semanticsLabel: "Flip",
              width: MediaQuery.of(context).size.width * 0.56,
            )
        )
    );
  }


}

class IdInput extends StatelessWidget{
  String test;
  TextEditingController controller;
  IdInput(this.test, this.controller, {super.key});
  @override
  Widget build(BuildContext context){
    return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.only(left: 80, right: 80),
        child: SizedBox(
          height: 40,
          child: TextField(
            style: GoogleFonts.sourceSansPro(),
            controller: controller,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none
                    )
                ),
                filled: true,
                hintText: test,
                hintStyle: TextStyle(
                  color: Color(0xff909090),
                  fontSize: 25,
                ),
                fillColor: Color(0xffEFEFEF)
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        )
    );
  }
}


