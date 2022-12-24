
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eco_wave/RestClient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSettingPage extends StatefulWidget {
  @override
  _ProfileSettingPage createState() => _ProfileSettingPage();
}

class _ProfileSettingPage extends State<ProfileSettingPage> {
  static final _nameController = TextEditingController();
  static final _introduceController = TextEditingController();
  File? _image;
  late RestClient client;
  String? token;

  @override
  void initState(){
    super.initState();
    loadToken();
    Dio dio = Dio();
    client = RestClient(dio);
  }


  loadToken() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
  }
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
                          top: MediaQuery.of(context).size.height * 0.037),
                    ),
                    Text(
                      "프로필 설정",
                      style: TextStyle(
                          fontFamily: 'Source_Sans_Pro',
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
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

  pictureSetting() {
    _getImage();
    log(_image.toString());
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
        margin:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.055),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xffD6D6D6)),
            borderRadius: BorderRadius.all(Radius.circular(10))),
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
        margin:
        EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.055),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xffD6D6D6)),
            borderRadius: BorderRadius.all(Radius.circular(10))),
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

  Widget imageProfile(){
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundImage: _image == null
              ? AssetImage('assets/icons/location_icon.png')
                : Image.file(_image!).image
          )
        ],
      ),
    );
  }

  settingBtnEvent() {
    settingProfile();
    log('click');
    // Navigator.of(context).pushNamedAndRemoveUntil('/mainNavigation', ModalRoute.withName('/'));

  }
  
  void settingProfile() async{
    log(_image.toString());
    log(_image!.path.toString());

    dynamic sendData = _image!.path;
    var formData = FormData.fromMap({'image' : await MultipartFile.fromFile(sendData, filename: "image")});
    var posResponse = await client.getProfileResponse(token!, _image!, true, _nameController.text, _introduceController.text);


  }


}
