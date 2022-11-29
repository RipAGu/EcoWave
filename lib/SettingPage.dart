import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPage createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
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
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.arrow_back,
                    size: 40,
                  ),
                  onPressed: () {Navigator.pop(context);},
                ),
                Container(
                    child: Text(
                  '설정',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Merri_Weather',
                      fontWeight: FontWeight.w800),
                )),
                Text("                ")
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.047,
                  left: MediaQuery.of(context).size.width * 0.03),
              child: Row(
                children: [
                  Text(
                    '아이디',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Merri_Weather'),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.06),
                  ),
                  Text(
                    'ecowave0422@gmail.com',
                    style: TextStyle(
                        fontFamily: 'Plus_Jakarta_Sans',
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
            ),
            TextButton(
                onPressed: null,
                child: Align(
                  child: Text(
                    '비밀번호 수정',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Merri_Weather',
                        color: Colors.black),
                  ),
                  alignment: Alignment.centerLeft,
                )),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
            ),
            TextButton(
                onPressed: null,
                child: Align(
                  child: Text(
                    '소셜 로그인 연동',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Merri_Weather',
                        color: Colors.black),
                  ),
                  alignment: Alignment.centerLeft,
                )),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
            ),
            TextButton(
                onPressed: null,
                child: Align(
                  child: Text(
                    '로그아웃',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Merri_Weather',
                        color: Colors.black),
                  ),
                  alignment: Alignment.centerLeft,
                )),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
            ),
            TextButton(
                onPressed: null,
                child: Align(
                  child: Text(
                    '회원탈퇴',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Merri_Weather',
                        color: Colors.black),
                  ),
                  alignment: Alignment.centerLeft,
                )),
            Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.36),),
            settingBtn(context)
          ],
        ),
      ),
    );
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
          "설정하기",
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
