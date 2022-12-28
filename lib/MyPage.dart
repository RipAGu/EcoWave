import 'package:dio/dio.dart';
import 'package:eco_wave/ModifyProfilePage.dart';
import 'package:eco_wave/RestClient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyPage extends StatefulWidget {
  String? token;
  MyPage(String token){
    this.token = token;
  }

  @override
  _MyPage createState() => _MyPage(token!);
}

class _MyPage extends State<MyPage> {
  late RestClient client;
  String? token;
  var data = [
    ['여의도에서 산책하며 플로깅해요', '플로깅', '3월 5일 일요일 14:00~16:00', '1/4', '여의도 한강공원'],
    ['인왕산 등산하면서 클린산행해요', '클린산행', '3월 11일 토요일 09:00~13:00', '3/4', '인왕산'],
    ['인왕산 등산하면서 클린산행해요', '클린산행', '3월 11일 토요일 09:00~13:00', '3/4', '인왕산'],

  ];

  var completeData = [
    ['여의도에서 산책하며 플로깅해요', '플로깅', '3월 5일 일요일 14:00~16:00', '1/4', '여의도 한강공원'],
    ['인왕산 등산하면서 클린산행해요', '클린산행', '3월 11일 토요일 09:00~13:00', '3/4', '인왕산'],
    ['인왕산 등산하면서 클린산행해요', '클린산행', '3월 11일 토요일 09:00~13:00', '3/4', '인왕산'],
  ];

  _MyPage(String token){
    this.token = token;
  }

  @override
  void initState(){
    super.initState();
    Dio dio = Dio();
    client = RestClient(dio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.07),
                    child: Text(
                      '마이페이지',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Source_Sans_Pro',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/setting.svg',
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      onPressed: ()
                      {settingBtnEvent();} ,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.033),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.07),
                  ),

                    SvgPicture.asset(
                      'assets/icons/avatar_1.svg',
                      width: MediaQuery.of(context).size.width * 0.144,
                    ),

                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.069),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.66,
                          child: RichText(
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            text: TextSpan(
                                text: '로우킴',
                                style: TextStyle(
                                    fontFamily: 'Merri_Weather',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.black)),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.66,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            text: TextSpan(
                                text: '환경스타트업 에코웨이브 CEO\n에코리더와 함께하는 플로깅',
                                style: TextStyle(
                                    fontFamily: 'Plus_Jakarta_Sans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color(0xff878787))),
                          )),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.024),
              ),
              modifyBtn(),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.033),
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Text(
                  '나의활동',
                  style: TextStyle(
                      fontFamily: 'Merri_Weather',
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ),



              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.016),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Image(
                  image: AssetImage('assets/icons/mypage_line.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.007),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.084),
                    child: Text(
                      '내 주최',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Merri_Weather'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                  ),
                  Text(
                    '3',
                    style: TextStyle(
                        fontFamily: 'Source_Sans_Pro',
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        color: Color(0xff30B2ED)),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.55),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffEDEDED)),
                        borderRadius: BorderRadius.circular(5)),
                    width: MediaQuery.of(context).size.width * 0.077,
                    height: MediaQuery.of(context).size.width * 0.077,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {},
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: floggingPost(data[index][0], data[index][1],
                          data[index][2], data[index][3], data[index][4]),
                    );
                  }),









              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.016),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Image(
                  image: AssetImage('assets/icons/mypage_line.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.007),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.084),
                    child: Text(
                      '예정',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Merri_Weather'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                  ),
                  Text(
                    '3',
                    style: TextStyle(
                        fontFamily: 'Source_Sans_Pro',
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        color: Color(0xff30B2ED)),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.6),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffEDEDED)),
                        borderRadius: BorderRadius.circular(5)),
                    width: MediaQuery.of(context).size.width * 0.077,
                    height: MediaQuery.of(context).size.width * 0.077,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {},
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: floggingPost(data[index][0], data[index][1],
                          data[index][2], data[index][3], data[index][4]),
                    );
                  }),

              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.016),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Image(
                  image: AssetImage('assets/icons/mypage_line.png'),
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.007),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.084),
                    child: Text(
                      '완료',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Merri_Weather'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                        fontFamily: 'Source_Sans_Pro',
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        color: Color(0xff30B2ED)),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.6),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffEDEDED)),
                        borderRadius: BorderRadius.circular(5)),
                    width: MediaQuery.of(context).size.width * 0.077,
                    height: MediaQuery.of(context).size.width * 0.077,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {},
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: floggingPost(data[index][0], data[index][1],
                          data[index][2], data[index][3], data[index][4]),
                    );
                  }),

            ],
          ),
        ),
      ),
    );
  }

  Widget modifyBtn() {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: MediaQuery.of(context).size.width * 0.88,
      height: MediaQuery.of(context).size.height * 0.058,
      child: OutlinedButton(
        onPressed: () {
          profileModifyBtnEvent();
        },
        child: Text(
          "프로필 수정",
          style: TextStyle(
              fontFamily: 'Plus_Jakarta_Sans',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff878787)),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(7)),
        ),
      ),
    );
  }

  loginBtnEvent() {}

  Widget floggingPost(String title, String option, String date, String capacity,
      String location) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Image(
              image: AssetImage('assets/icons/sample_image.png'),
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.038),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.09,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Plus_Jakarta_Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.009),
                  ),
                  Row(
                    children: [
                      Image(
                        image: AssetImage('assets/icons/recycle_icon.png'),
                        width: MediaQuery.of(context).size.width * 0.043,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        width: MediaQuery.of(context).size.width * 0.13,
                        child: Text(
                          option,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Plus_Jakarata_Sans',
                              fontSize: 12,
                              color: Color(0xff878787)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 7),
                      ),
                      Image(
                        image: AssetImage('assets/icons/calendar.png'),
                        width: MediaQuery.of(context).size.width * 0.043,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Plus_Jakarata_Sans',
                            fontSize: 12,
                            color: Color(0xff878787)),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                  ),
                  Row(
                    children: [
                      Image(
                        image: AssetImage('assets/icons/human_icon.png'),
                        width: MediaQuery.of(context).size.width * 0.043,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        width: MediaQuery.of(context).size.width * 0.13,
                        child: Text(
                          capacity,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Plus_Jakarata_Sans',
                              fontSize: 12,
                              color: Color(0xff878787)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 7),
                      ),
                      Image(
                        image: AssetImage('assets/icons/location_icon.png'),
                        width: MediaQuery.of(context).size.width * 0.043,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                      ),
                      Text(
                        location,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Plus_Jakarata_Sans',
                            fontSize: 12,
                            color: Color(0xff878787)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  settingBtnEvent(){
    Navigator.of(context).pushNamed('/settingPage');

  }

  profileModifyBtnEvent(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ModifyProfilePage(token!)));

  }
}
