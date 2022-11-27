import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:eco_wave/LoginPage.dart';
import 'package:eco_wave/ProfileSettingPage.dart';
import 'package:eco_wave/RegisterPage2.dart';
import 'package:eco_wave/ResigterPage1.dart';
import 'package:eco_wave/common/my_flutter_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {

  var data = [
    ['여의도에서 산책하며 플로깅해요', '플로깅', '3월 5일 일요일 14:00~16:00', '1/4', '여의도 한강공원'],
    ['인왕산 등산하면서 클린산행해요', '클린산행', '3월 11일 토요일 09:00~13:00', '3/4', '인왕산'],
    ['인왕산 등산하면서 클린산행해요', '클린산행', '3월 11일 토요일 09:00~13:00', '3/4', '인왕산'],
    ['인왕산 등산하면서 클린산행해요', '클린산행', '3월 11일 토요일 09:00~13:00', '3/4', '인왕산'],
    ['인왕산 등산하면서 클린산행해요', '클린산행', '3월 11일 토요일 09:00~13:00', '3/4', '인왕산'],
    ['인왕산 등산하면서 클린산행해요', '클린산행', '3월 11일 토요일 09:00~13:00', '3/4', '인왕산']
  ];
  static final _searchController = TextEditingController();
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        6,
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
                  "Page $index",
                  style: TextStyle(color: Colors.indigo),
                )),
              ),
            ));

    return Scaffold(
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
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
                child: PageView.builder(
                  controller: controller,
                  // itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
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
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: floggingPost(data[index][0], data[index][1],
                            data[index][2], data[index][3], data[index][4]),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget searchField() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
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
            onPressed: () {},
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffD6D6D6))),
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

  Widget floggingPost(String title, String option, String date, String capacity,
      String location) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/meetingDetailPage');      },
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


}

