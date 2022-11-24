import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget{
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage>{
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
                    top: MediaQuery.of(context).size.height * 0.01),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.height * 0.15,
                      child: IconButton(
                        icon: SvgPicture.asset('assets/icons/add_icon.svg',
                          width: MediaQuery.of(context).size.width * 0.12,
                          height: MediaQuery.of(context).size.height * 0.12,),
                        onPressed: (){},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        'assets/icons/mini_logo.svg',
                        semanticsLabel: "Flip",
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: IconButton(
                      icon: SvgPicture.asset('assets/icons/avatar_1.svg',
                        width: MediaQuery.of(context).size.width * 0.12,
                        height: MediaQuery.of(context).size.height * 0.12,),
                      onPressed: (){},
                    ),
                  ),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}