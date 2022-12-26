
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:eco_wave/LoginPage.dart';
import 'package:eco_wave/MeetingDetailPage.dart';
import 'package:eco_wave/ProfileSettingPage.dart';
import 'package:eco_wave/RegisterPage2.dart';
import 'package:eco_wave/ResigterPage1.dart';
import 'package:eco_wave/RestClient.dart';
import 'package:eco_wave/common/my_flutter_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainPage extends StatefulWidget {
  String token = "";
  MainPage(String token){
    this.token = token;
  }
  @override
  _MainPage createState() => _MainPage(token);
}

class _MainPage extends State<MainPage> {
  late RestClient client;
  String? token;
  List<String> banner = [];

  _MainPage(String token){
    this.token = token;
    log(token);
  }


  var meetingData = [];
  static final _searchController = TextEditingController();
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  void initState(){
    super.initState();
    loadToken();

    Dio dio = Dio();
    client = RestClient(dio);

  }


  Future<void> loadToken() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");

    // bannerTest();

  }



  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        3,
        (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade300,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Container(
                height: 280,
                child: Center(
                    child: Text(
                  "test",
                  style: TextStyle(color: Colors.indigo),
                )),
              ),
            ));

    return Scaffold(
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
                    icon: SvgPicture.asset(
                      'assets/icons/add_icon.svg',
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                    onPressed: () {    Navigator.of(context).pushNamed('/createMeetingPage');},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01),
                  child: SvgPicture.asset(
                    'assets/icons/mini_logo.svg',
                    semanticsLabel: "Flip",
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/avatar_1.svg',
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.17,
              child: FutureBuilder(
                future: client.getBannerResponse(token!),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.hasData == false){
                    return Text('test');
                  }
                  else{

                    final test = snapshot.data;
                    log(test.data.result.length.toString());

                    for(int i = 0; i < test.data.result!.length; i++){
                      banner.add(test.data.result![i].image!);
                    }

                    final pages = List.generate(
                        test.data.result.length,
                            (index) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey.shade300,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          child: Container(
                            height: 280,
                                child: Image.network('http://15.165.175.81:3000/' + banner[index], fit: BoxFit.cover,)


                          ),
                        ));


                    return PageView.builder(
                      controller: controller,
                      itemBuilder: (_, index) {
                        return pages[index % pages.length];
                      },
                    );
                  }
                },
              ),


            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: pages.length,
              effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: Color(0xffB9D4DC),
                  activeDotColor: Color(0xff00A1E9)
                  // strokeWidth: 5,
                  ),
            ),

            Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.023)),
            searchField(),


            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.43,
              child: FutureBuilder(
                future: client.getMeetingListResponse(token!),
                builder: (BuildContext context, AsyncSnapshot snapshot2){
                  if(snapshot2.hasData == false){
                    return Text('null');
                  }
                  else{
                    final meetingList = snapshot2.data;
                    log(meetingList.data.result![0].image[0].toString());

                    log(meetingList.data.result![0].type.toString());

                    for(int i = 0; i < meetingList.data.result!.length; i++){
                      var tmpList = [];
                      if (meetingList.data.result![i].image.length > 0) {
                        tmpList.add(meetingList.data.result![i].image[0]);
                      } else {
                        tmpList.add("");
                      }
                      tmpList.add(meetingList.data.result![i].title);
                      tmpList.add(meetingList.data.result![i].type);
                      tmpList.add(meetingList.data.result![i].date);
                      tmpList.add(meetingList.data.result![i].status);
                      tmpList.add(meetingList.data.result![i].place);
                      tmpList.add(meetingList.data.result![i].event_idx);
                      meetingData.add(tmpList);
                    }


                    return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: meetingList.data.result!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: floggingPost(meetingData[index][0],
                                meetingData[index][1], meetingData[index][2], meetingData[index][3],
                                meetingData[index][4], meetingData[index][5], meetingData[index][6]),

                          );
                        });
                  }
                },
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget searchField() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0xffD6D6D6)),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          prefixIcon: IconButton(
              padding: EdgeInsets.only(top: 7),
              icon: SvgPicture.asset(
                'assets/icons/search-normal.svg',
                width: MediaQuery.of(context).size.width * 0.07,
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              onPressed: null),
          suffixIcon: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/search_setting.svg',
              width: MediaQuery.of(context).size.width * 0.07,
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            onPressed: () {    Navigator.of(context).pushNamed('/searchSettingPage');
            },
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          border: InputBorder.none,
          hintText: 'Search Plogging',
          hintStyle: TextStyle(fontSize: 14, color: Color(0xff878787)),
        ),
      ),
    );
  }

  Widget test(String msg) {
    return Text(
      msg,
      style: TextStyle(fontSize: 20),
    );
  }

  Widget floggingPost(String image, String title, String option, String date, String capacity,
      String location, int eventIdx) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MeetingDetailPage(token!, eventIdx)));
        log("test");
        },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Image.network('http://15.165.175.81:3000/' + image, fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.2,),

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


}

