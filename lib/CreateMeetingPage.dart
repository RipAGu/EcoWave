import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

class CreateMeetingPage extends StatefulWidget {
  @override
  _CreateMeetingPage createState() => _CreateMeetingPage();
}

class _CreateMeetingPage extends State<CreateMeetingPage> {
  String yearMonthDayTime = '';
  TextEditingController ymdtController = TextEditingController();
  var date = '선택';
  var startTime = '선택';
  var endTime = '선택';
  var number = 1;
  final List<bool> _selectedOption = <bool>[false, false, false];
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
                    top: MediaQuery.of(context).size.height * 0.01),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                      child: Text(
                    '모임개설',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Merri_Weather',
                        fontWeight: FontWeight.w800),
                  )),
                  SizedBox(
                    child: IconButton(
                      icon: Image(
                        image: AssetImage('assets/icons/photo.png'),
                        width: MediaQuery.of(context).size.width * 0.096,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              titleField(),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.023,
                    left: MediaQuery.of(context).size.width * 0.065,
                    right: MediaQuery.of(context).size.width * 0.065),
                child: Row(
                  children: [
                    Text(
                      '종류',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Merri_Weather'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.055),
                    ),
                    optionButton(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.023,
                  left: MediaQuery.of(context).size.width * 0.065,
                ),
                child: Row(
                  children: [
                    Text(
                      '일정',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Merri_Weather'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.055),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.72,
                      height: MediaQuery.of(context).size.height * 0.044,
                      child: OutlinedButton(
                        onPressed: () {
                          datePicker();
                        },
                        child: Text(
                          date,
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
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.023,
                  left: MediaQuery.of(context).size.width * 0.065,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.15),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.28,
                      height: MediaQuery.of(context).size.height * 0.044,
                      child: OutlinedButton(
                        onPressed: () {
                          startTimePicker();
                        },
                        child: Text(
                          startTime,
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
                    ),
                    Text(
                      '부터',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Merri_Weather',
                          fontWeight: FontWeight.w700,
                          color: Color(0xff878787)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.28,
                      height: MediaQuery.of(context).size.height * 0.044,
                      child: OutlinedButton(
                        onPressed: () {
                          endTimePicker();
                        },
                        child: Text(
                          endTime,
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
                    ),
                    Text(
                      '까지',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Merri_Weather',
                          fontWeight: FontWeight.w700,
                          color: Color(0xff878787)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.023,
                  left: MediaQuery.of(context).size.width * 0.065,
                ),
                child: Row(
                  children: [
                    Text(
                      '장소',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Merri_Weather'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.055),
                      width: MediaQuery.of(context).size.width * 0.28,
                      height: MediaQuery.of(context).size.height * 0.044,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "주소찾기",
                          style: TextStyle(
                              fontFamily: 'Source_Sans_Pro',
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff7FCFF3),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0))),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.22,
                    top: MediaQuery.of(context).size.height * 0.013),
                padding: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width * 0.72,
                height: MediaQuery.of(context).size.height * 0.044,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xffD6D6D6)),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Align(
                  child: Text(
                    '주소',
                    style: TextStyle(
                        fontFamily: 'Plus_Jakarta_Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff878787)),
                    textAlign: TextAlign.start,
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
      Container(
          margin:
          EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.22,
              top: MediaQuery.of(context).size.height * 0.013),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xffD6D6D6)),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          width: MediaQuery.of(context).size.width * 0.72,
          height: MediaQuery.of(context).size.height * 0.044,

            child: TextField(
              style: TextStyle(fontFamily: 'Source_Sans_Pro'),
              decoration: InputDecoration(
                border: InputBorder.none,
                  isDense: true,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 6, horizontal: 10),

                  hintText: "장소 약칭",
                  hintStyle: TextStyle(
                      fontFamily: 'Plus_Jakarta_Sans',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff878787)),),

          )),
              Container(

                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.023,
                  left: MediaQuery.of(context).size.width * 0.065,
                ),

                  child: Row(

                    children: [
                    Text(
                    '인원',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Merri_Weather'),
                  ),
                      Stack(
                        children: [
                      Container(
                      padding: EdgeInsets.all(0.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.0)), color: Color(0xffF3F3F3),),
                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.24),
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: MediaQuery.of(context).size.height * 0.04,
                      ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.24),),
                              CircleAvatar(
                                child :IconButton(
                                    padding: EdgeInsets.all(0.0),
                                    onPressed: (){
                                      setState(() {
                                        if(number > 1)
                                          number--;
                                      });
                                    }, icon: Icon(Icons.remove, color: Colors.white,)),
                                backgroundColor: Color(0xff7FCFF3),
                                radius: 15,

                              ),

                              Container(
                                margin: EdgeInsets.only(left: 40, right: 40),
                                child: Text(number.toString()),
                              ),
                              CircleAvatar(
                                child :IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: (){
                                      setState(() {
                                        if(number < 4)
                                        number++;
                                      });
                                    }, icon: Icon(Icons.add, color: Colors.white,)),
                                backgroundColor: Color(0xff7FCFF3),
                                radius: 15,

                              ),

                            ],
                          ),
                        ],
                      ),
                  ],

                ),
              ),
              Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04
              ,left: MediaQuery.of(context).size.width * 0.065,),
              child: Text(
                '소개',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Merri_Weather'),
              ),),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.023,
                  left: MediaQuery.of(context).size.width * 0.065,),
                width: MediaQuery.of(context).size.width * 0.884,
                height: MediaQuery.of(context).size.height * 0.17,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xffD6D6D6)),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    style: TextStyle(fontFamily: 'Source_Sans_Pro'),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),

                      hintText: "활동장소와 내용을 구체적으로 입력해주세요\n\nex)여의나루역3번출구에서 만날 예정이에요\n"
                          "준비물:집게 또는 장갑, 운동화\n제공물품:생분해성봉투, 비건 간식 등",
                      hintStyle: TextStyle(
                          fontFamily: 'Plus_Jakarta_Sans',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff878787)),),

                  )
              ),

              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.035,
                left: MediaQuery.of(context).size.width * 0.3,),


                child: createBtn(context),

              ),
              Container(margin: EdgeInsets.only(top: 10),)




            ],
          ),
        ),
      ),
    );
  }

  Widget titleField() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0xffD6D6D6)),
          borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
        ),

          child: TextField(
            style: TextStyle(fontFamily: 'Source_Sans_Pro'),
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                border: InputBorder.none,
                hintText: "제목을 입력해주세요",
                hintStyle: TextStyle(color: Color(0xff878787))),
          ),
        );
  }

  Widget optionButton() {
    return ToggleButtons(
        children: <Widget>[Text('플로깅'), Text('클린산행'), Text('비치코밍')],
        constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.235,
            minHeight: MediaQuery.of(context).size.height * 0.05),
        borderRadius: BorderRadius.circular(5),
        textStyle: TextStyle(
            fontFamily: 'Plus_Jakarata_Sans',
            fontWeight: FontWeight.w500,
            fontSize: 16,
       ),
        disabledColor: Colors.white,
        fillColor: Colors.white,
        selectedColor: Color(0xff00A1E9),
        color: Color(0xff878787),
        onPressed: (int index) {
          setState(() {
            for (int buttonIndex = 0;
                buttonIndex < _selectedOption.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                _selectedOption[buttonIndex] = true;
              } else {
                _selectedOption[buttonIndex] = false;
              }
            }
          });
        },
        isSelected: _selectedOption);
  }

  Widget calendar() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.044,
        width: MediaQuery.of(context).size.width * 0.72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).hintColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5)
          ],
        ),
        child: ExpansionTile(
          backgroundColor: Colors.white,
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          initiallyExpanded: true,
          title: Text(
            'Messages',
          ),
          children: List.generate(3, (indexProduct) {
            return Text("terwyteuwte");
          }),
        ));
  }

  Future yesNo() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              '모임을 개설하겠습니다',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Plus_Jakarta_Sans',
                  fontSize: 20),
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                  yes();
                },
                child: Text(
                  '네',
                  style: TextStyle(color: Color(0xffC8CBD2)),
                ),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '아니오',
                  style: TextStyle(color: Color(0xffC8CBD2)),
                ),
              )
            ],
          );
        });
  }

  Future yes() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              '모임이 개설되었습니다',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Plus_Jakarta_Sans',
                  fontSize: 20),
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);

                },
                child: Text(
                  '네',
                  style: TextStyle(color: Color(0xffC8CBD2)),
                ),
              ),
            ],
          );
        });
  }

  Future datePicker() async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2023, 1, 1));

    if (dateTime != null)
      setState(() {
        date = dateTime.toString();
      });
    else {
      setState(() {
        date = '선택';
      });
    }
  }

  Future startTimePicker() async {
    DateTime? selectTime = await TimePicker.show(
        context: context,
        sheet: TimePickerSheet(
          sheetTitle: '',
          minuteTitle: '분',
          hourTitle: '시',
          saveButtonText: '선택',
          sheetCloseIconColor: Colors.black,
        ));

    if (selectTime != null) {
      setState(() {
        startTime = selectTime.toString();
      });
    }
  }

  Future endTimePicker() async {
    DateTime? selectTime = await TimePicker.show(
        context: context,
        sheet: TimePickerSheet(
          sheetTitle: 'hi',
          minuteTitle: '분',
          hourTitle: '시',
          saveButtonText: '선택',
          sheetCloseIconColor: Colors.black,
          saveButtonColor: Colors.black,
        ));

    if (selectTime != null) {
      setState(() {
        endTime = selectTime.toString();
      });
    }
  }

  Widget createBtn(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.42,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          createBtnEvent();
        },
        child: Text(
          "개설하기",
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

  createBtnEvent(){
    yesNo();
  }
}
