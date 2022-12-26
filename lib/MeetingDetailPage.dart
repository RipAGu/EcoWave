import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eco_wave/RestClient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MeetingDetailPage extends StatefulWidget {
  var token;
  var eventIdx;
  MeetingDetailPage(String token, int eventIdx) {
    this.token = token;
    this.eventIdx = eventIdx;
  }
  @override
  _MeetingDetailPage createState() => _MeetingDetailPage(token, eventIdx);
}

class _MeetingDetailPage extends State<MeetingDetailPage> {
  var token;
  var eventIdx;
  late RestClient client;

  _MeetingDetailPage(String token, int eventIdx) {
    this.token = token;
    this.eventIdx = eventIdx;
  }

  @override
  void initState() {
    super.initState();
    Dio dio = Dio();
    client = RestClient(dio);
    log(eventIdx.toString());
  }

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
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.44,


                child: FutureBuilder(
                  future: client.getMeetingDetailResponse(token, eventIdx),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData == false) {
                      return Text('null');
                    } else {
                      final data = snapshot.data;
                      log(data.data.image[0]);
                      return Image.network(
                          'http://15.165.175.81:3000/' + data.data.image[0], fit: BoxFit.cover,);
                    }
                  },
                ),
              )
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrolController) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                    controller: scrolController,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.044,
                          left: MediaQuery.of(context).size.width * 0.072),
                      child: FutureBuilder(
                        future:
                            client.getMeetingDetailResponse(token, eventIdx),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData == false) {
                            return Text("null");
                          } else {
                            final detailData = snapshot.data;
                            List? partiImageList = [];
                            for(int i = 0; i < detailData.data.register.length; i++){
                              if(detailData.data.register[i].image != null) {
                                partiImageList.add(
                                    detailData.data.register[i].image);
                              }
                              else{
                                partiImageList.add("no");
                              }
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  detailData.data.title,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Merri_Weather',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery
                                          .of(context)
                                          .size
                                          .height *
                                          0.009),
                                ),
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/icons/recycle_icon.png'),
                                      fit: BoxFit.contain,
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          0.06,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 4),
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          0.13,
                                      child: Text(
                                        detailData.data.type,
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
                                      image:
                                      AssetImage('assets/icons/calendar.png'),
                                      fit: BoxFit.contain,
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          0.06,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 4),
                                    ),
                                    Text(
                                      detailData.data.date,
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
                                      image: AssetImage(
                                          'assets/icons/human_icon.png'),
                                      fit: BoxFit.contain,
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          0.06,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 4),
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          0.13,
                                      child: Text(
                                        detailData.data.status,
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
                                      image: AssetImage(
                                          'assets/icons/location_icon.png'),
                                      fit: BoxFit.contain,
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          0.06,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 4),
                                    ),
                                    Text(
                                      detailData.data.place,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Plus_Jakarata_Sans',
                                          fontSize: 12,
                                          color: Color(0xff878787)),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery
                                          .of(context)
                                          .size
                                          .height *
                                          0.026),
                                ),
                                Text(
                                  '소개',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Merri_Weather'),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery
                                          .of(context)
                                          .size
                                          .height *
                                          0.022),
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.85,
                                  child: RichText(
                                    maxLines: 10,
                                    overflow: TextOverflow.ellipsis,
                                    strutStyle: StrutStyle(fontSize: 18),
                                    text: TextSpan(
                                        text:
                                        detailData.data.introduce,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontFamily: 'Source_Sans_Pro',
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery
                                          .of(context)
                                          .size
                                          .height *
                                          0.022),
                                ),
                                Text(
                                  '장소',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Merri_Weather'),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery
                                          .of(context)
                                          .size
                                          .height *
                                          0.022),
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.85,
                                  child: RichText(
                                    maxLines: 10,
                                    overflow: TextOverflow.ellipsis,
                                    strutStyle: StrutStyle(fontSize: 18),
                                    text: TextSpan(
                                        text:
                                        detailData.data.place,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontFamily: 'Source_Sans_Pro',
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery
                                          .of(context)
                                          .size
                                          .height *
                                          0.022),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '참가멤버',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Merri_Weather'),
                                    ),
                                    Text("  " + detailData.data.status)
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery
                                          .of(context)
                                          .size
                                          .height *
                                          0.022),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,

                                    itemCount: partiImageList.length,
                                    itemBuilder: (BuildContext context, int index){
                                      if(partiImageList[index] == "no"){
                                        return Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: ClipOval(
                                            child: Image.asset('assets/icons/avatar_2.png', width: 50, height: 50, fit: BoxFit.cover,),
                                          ),
                                        );
                                      }
                                      else {
                                        return Container(
                                          margin: EdgeInsets.only(right: 10),

                                          child: ClipOval(
                                            child: Image.network(
                                              'http://15.165.175.81:3000/' +
                                                  partiImageList[index],
                                              fit: BoxFit.cover,
                                              width: 50, height: 50,),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  width: double.infinity,
                                  height: 50,
                                  alignment: Alignment.centerLeft,
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 100),
                                )
                              ],
                            );
                          }
                        },
                      ),
                    )),
              );
            },
          ),
          FutureBuilder(
              future: client.getMeetingDetailResponse(token, eventIdx),
            builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasData == true){
                  final btnData = snapshot.data;
                  return participateBtn(context, btnData.data.is_register);
            }
                else{
                  return Text('null');
                }
            },
          )
        ],
      ),
    );
  }

  Widget participateBtn(BuildContext context, bool isRegister) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width * 0.42,
        height: 50,
        child: isRegister == false ? ElevatedButton(
          onPressed: () {
            yesNo("이번 모임을 참가하겠습니다");
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
        ) 
            : ElevatedButton(
          onPressed: () {
            yesNo("참가 신청을 취소하겠습니다");
          },
          child: Text(
            "취소하기",
            style: TextStyle(
                fontFamily: 'Source_Sans_Pro',
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff878787),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0))),
        )
      ),
    );
  }

  Future yesNo(String msg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              msg,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Plus_Jakarta_Sans',
                  fontSize: 20),
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  if(msg == "이번 모임을 참가하겠습니다") {
                    Navigator.pop(context);
                    participate();
                  }
                  else{
                    Navigator.pop(context);
                    cancel();

                  }
                },
                child: Text(
                  '네',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '아니오',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          );
        });
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
                  Navigator.pop(context);
                  setState(() {

                  });

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

  void participate() async{
    MeetingParticipateRequest meetingParticipateRequest = MeetingParticipateRequest(event_idx: eventIdx);
    var posResponse = await client.getMeetingParticipateResponse(token, meetingParticipateRequest);
    if(posResponse.success == false){
      yes(posResponse.message!);
    }
    else{
      yes("참가신청이 완료되었습니다");
    }
  }
  void cancel() async{
    MeetingCancelRequest meetingCancelRequest = MeetingCancelRequest(event_idx: eventIdx);
    var posResponse = await client.getMeetingCancelResponse(token, meetingCancelRequest);
    if(posResponse.success == false){
      yes(posResponse.message!);
    }
    else{
      yes("참가 신청이 취소되었습니다");
    }

  }
}
