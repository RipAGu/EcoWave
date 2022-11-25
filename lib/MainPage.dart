import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainPage extends StatefulWidget{
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage>{
  static final _searchController = TextEditingController();
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context){
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
                  dotColor: Color(0xff00A1E9),
                  activeDotColor: Color(0xff00A1E9)
                  // strokeWidth: 5,
                ),
              ),
              Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.023)),

              searchField(),




            ],
          ),
        ),
      ),
    );
  }

  Widget searchField(){
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            padding: EdgeInsets.only(top: 7),
            icon: SvgPicture.asset('assets/icons/search-normal.svg',
              width: MediaQuery.of(context).size.width * 0.07,
              height: MediaQuery.of(context).size.height * 0.07,),
            onPressed: null
          ),
          suffixIcon: IconButton(
            icon: SvgPicture.asset('assets/icons/search_setting.svg',
              width: MediaQuery.of(context).size.width * 0.07,
              height: MediaQuery.of(context).size.height * 0.07,),
            onPressed: (){},
          ),
          contentPadding:
          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffD6D6D6))),
          hintText: 'Search Plogging',
          hintStyle: TextStyle(
            fontSize: 14,
            color: Color(0xff878787)
          ),

        ),

      ),
    );
  }
}