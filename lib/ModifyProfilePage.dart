import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eco_wave/RestClient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModifyProfilePage extends StatefulWidget{
  String? token;
  ModifyProfilePage(String token){
    this.token = token;

  }

  @override
  _ModifyProfilePage createState() => _ModifyProfilePage(token!);
}


class _ModifyProfilePage extends State<ModifyProfilePage>{
  File? _image;
  var _nameController = TextEditingController();
  var _introduceController = TextEditingController();
  late RestClient client;
  String? token;

  _ModifyProfilePage(String token){
    this.token = token;
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
                    child: imageProfile(),

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
                  Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),),
                  settingBtn(context)

                ],
              ),


            )));
  }
  Widget imageProfile(){
    return Container(
      width: 100,
      height: 100,
      child: Center(
        child: CircleAvatar(
            radius: 80,
            backgroundImage: _image == null
                ? AssetImage('assets/icons/avatar_2.png')
                : Image.file(_image!).image
        ),
      ),
    );
  }



  pictureSetting() {
    _getImage();
  }

  Future _getImage() async{
    var picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);

    });
  }

  Widget nameField() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xffD6D6D6)),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.055),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.72,
          child: TextField(
            controller: _nameController,
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
            controller: _introduceController,
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

  void settingProfile() async{
    var sendImage;
    if(_image == null) sendImage = "";
    else sendImage = _image;
    var posResponse = await client.getProfileResponse(token!, sendImage, true, _nameController.text, _introduceController.text);
    if(posResponse.success == false){
      yes(posResponse.message!);
    }
    else{
      yes("수정이 완료되었습니다");

    }
  }

  settingBtnEvent() {
    if(_nameController.text == "") yes("이름을 입력하세요");
    else if(_introduceController.text == "") yes("소개를 입력하세요");
    else if(_image == null) yes("사진을 선택해주세요");
    else{
      settingProfile();
    }
    // Navigator.of(context).pushNamedAndRemoveUntil('/mainNavigation', ModalRoute.withName('/'));

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
                  if(msg == "수정이 완료되었습니다") {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    _introduceController.clear();
                    _nameController.clear();
                  }
                  else {
                    Navigator.pop(context);
                  }


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