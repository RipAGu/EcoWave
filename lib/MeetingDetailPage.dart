import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MeetingDetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7FCFF3),
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.037),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 40,
                ),
                onPressed: () {Navigator.pop(context);},
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1, left: MediaQuery.of(context).size.width * 0.45),
                child: Text('사진'
                ),
              )
            ],
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrolController){
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  controller: scrolController,
                  child: Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.044, left: MediaQuery.of(context).size.width * 0.072),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '여의도에서 산책하며 플로깅해요',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Merri_Weather',
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
                              fit: BoxFit.contain,
                              width: MediaQuery.of(context).size.width * 0.06,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              width: MediaQuery.of(context).size.width * 0.13,
                              child: Text(
                                'option',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Plus_Jakarata_Sans',
                                    fontSize: 12,
                                    color: Color(0xff878787)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                            ),
                            Image(
                              image: AssetImage('assets/icons/calendar.png'),
                              fit: BoxFit.contain,

                              width: MediaQuery.of(context).size.width * 0.06,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                            ),
                            Text(
                              'date',
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
                              fit: BoxFit.contain,

                              width: MediaQuery.of(context).size.width * 0.06,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              width: MediaQuery.of(context).size.width * 0.13,
                              child: Text(
                                'capacity',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Plus_Jakarata_Sans',
                                    fontSize: 12,
                                    color: Color(0xff878787)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                            ),
                            Image(
                              image: AssetImage('assets/icons/location_icon.png'),
                              fit: BoxFit.contain,

                              width: MediaQuery.of(context).size.width * 0.06,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                            ),
                            Text(
                              'location',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Plus_Jakarata_Sans',
                                  fontSize: 12,
                                  color: Color(0xff878787)),
                            ),
                          ],
                        ),
                        Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.026),),
                        Text('소개', style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Merri_Weather'
                        ),),
                        Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.022),
                          width: MediaQuery.of(context).size.width * 0.85,

                            child: RichText(
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              strutStyle: StrutStyle(fontSize: 18),
                              text: TextSpan(
                                text: '여의나루역 3번 출구에서 만나 가볍게 2시간 정도 산책하면서 플로깅하실 분 모집합니다.'
                                    ' 참여하는 모든 분들께 친환경 후원 물품을 제공해드려요:D\n\n준비물: 집게 또는 장갑\n제공물품:생분해성 봉투, 비건간식',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontFamily: 'Source_Sans_Pro',
                                  fontWeight: FontWeight.w500
                                )
                              ),
                            ),

                        ),
                        Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.022),),
                        Text('장소', style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Merri_Weather'
                        ),),
                        Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.022),
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.27,
                          decoration: BoxDecoration(color: Color(0x8000A1E9), borderRadius: BorderRadius.all(Radius.circular(10))),

                        ),
                        Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.022),),
                        Row(
                          children: [
                            Text('참가멤버', style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Merri_Weather'
                            ),),
                            Text('(2/4)')
                          ],
                        ),
                        Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.022),),
                        SizedBox(
                          child: SvgPicture.asset(
                            'assets/icons/avatar_1.svg',
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                        ),
                        Container(margin: EdgeInsets.only(top: 100),)

                      ],

                    ),
                  )


                ),
              );
            },
          ),
          participateBtn(context),

        ],
      ),
    );
  }

  Widget participateBtn(BuildContext context){
    return Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          width: MediaQuery.of(context).size.width * 0.42,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              yesNo(context);
            },
            child: Text(
              "참가하기",
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
        ),

    );
  }
  Future yesNo(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return CupertinoAlertDialog(
        title: Text('이번 모임을 참가하겠습니다', style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Plus_Jakarta_Sans', fontSize: 20),),
        actions: [
          CupertinoDialogAction(onPressed: (){
            Navigator.pop(context);
            yes(context);

          },
            child: Text('네', style: TextStyle(color: Color(0xffC8CBD2)),),),
          CupertinoDialogAction(onPressed: (){Navigator.pop(context);}, child: Text('아니오',style: TextStyle(color: Color(0xffC8CBD2)),),)

        ],
      );
    });
  }

  Future yes(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return CupertinoAlertDialog(
        title: Text('참가 신청이 완료되었습니다', style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Plus_Jakarta_Sans', fontSize: 20),),
        actions: [
          CupertinoDialogAction(onPressed: (){
            Navigator.pop(context);

          },
            child: Text('네', style: TextStyle(color: Color(0xffC8CBD2)),),),

        ],
      );
    });
  }
}