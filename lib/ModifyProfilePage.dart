import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModifyProfilePage extends StatefulWidget{
  @override
  _ModifyProfilePage createState() => _ModifyProfilePage();
}


class _ModifyProfilePage extends State<ModifyProfilePage>{

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
                        top: MediaQuery.of(context).size.height * 0.037),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 40,
                          ),
                          onPressed: () {},
                        ),
                      Container(
                          child: Text(
                            '프로필 수정',
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Merri_Weather',
                                fontWeight: FontWeight.w800),
                          )),
                      Text("           ")
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.043),
                      child: SizedBox(
                        child: SvgPicture.asset(
                          'assets/icons/avatar_1.svg',
                          width: MediaQuery.of(context).size.width * 0.144,
                        ),
                      )

                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.028),
                  ),
                  GestureDetector(
                    child: Text(
                      "사진설정",
                      style: TextStyle(
                          fontFamily: 'Plus_Jakarta_Sans',
                          fontSize: 14,
                          color: Color(0xff878787)),
                    ),
                    onTap: () {
                      pictureSetting();
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.035),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.07),
                      ),
                      Text(
                        '이름',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Merri_Weather',
                            fontWeight: FontWeight.w700),
                      ),
                      nameField(),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.033),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.07),
                      ),
                      Text(
                        '소개',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Merri_Weather',
                            fontWeight: FontWeight.w700),
                      ),
                      introduceField(),
                    ],
                  ),
                  Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.450),),
                  settingBtn(context)

                ],
              ),


            )));
  }

  pictureSetting() {}

  Widget nameField() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xffD6D6D6)),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.055),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.72,
          child: TextField(
            style: TextStyle(fontFamily: 'Source_Sans_Pro'),
            decoration: InputDecoration(
                isDense: true,
                contentPadding:
                EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                border: InputBorder.none,
                hintText: "입력하세요",
                hintStyle: TextStyle(color: Color(0xff878787))),
          ),
        ));
  }

  Widget introduceField() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xffD6D6D6)),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.055),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.72,
          child: TextField(
            style: TextStyle(fontFamily: 'Source_Sans_Pro'),
            decoration: InputDecoration(
                isDense: true,
                contentPadding:
                EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                border: InputBorder.none,
                hintText: "입력하세요",
                hintStyle: TextStyle(color: Color(0xff878787))),
          ),
        ));
  }

  Widget settingBtn(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.42,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          settingBtnEvent();
        },
        child: Text(
          "수정하기",
          style: TextStyle(
              fontFamily: 'Source_Sans_Pro',
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff00A1E9),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0))),
      ),
    );
  }

  settingBtnEvent() {
    Navigator.of(context).pop();

  }
}