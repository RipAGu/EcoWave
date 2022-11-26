import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateMeetingPage extends StatefulWidget {
  @override
  _CreateMeetingPage createState() => _CreateMeetingPage();
}

class _CreateMeetingPage extends State<CreateMeetingPage> {
  final List<bool> _selectedOption = <bool>[true, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      icon: Icon(
                        Icons.arrow_back,
                        size: 40,
                      ),
                      onPressed: () {},
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
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.023,
                left: MediaQuery.of(context).size.width * 0.065,
                    right: MediaQuery.of(context).size.width * 0.065),
                child: Row(
                  children: [
                    Text('종류', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, fontFamily: 'Merri_Weather'),),
                    Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.055),),
                    optionButton(),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget titleField(){
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, ),
        child: SizedBox(
          child: TextField(
            style: TextStyle(fontFamily: 'Source_Sans_Pro'),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xffD6D6D6))),
                hintText: "제목을 입력해주세요",
                hintStyle: TextStyle(color: Color(0xff878787))),
          ),
        )
    );
  }

  Widget optionButton(){
    return ToggleButtons(children: <Widget>[
      Text('플로깅'),
      Text('클린산행'),
      Text('비치코밍')
    ],
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.235,
          minHeight: MediaQuery.of(context).size.height * 0.05
        ),
        borderRadius: BorderRadius.circular(5),
        textStyle: TextStyle(fontFamily: 'Plus_Jakarata_Sans', fontWeight: FontWeight.w500, fontSize: 16),

        disabledBorderColor: Colors.amber,
        disabledColor: Colors.white,
        fillColor: Colors.white,
        selectedColor: Color(0xff00A1E9),
        onPressed: (int index){
      setState(() {
        for (int buttonIndex = 0; buttonIndex < _selectedOption.length; buttonIndex++){
          if(buttonIndex == index) {
            _selectedOption[buttonIndex] = true;
          }
          else{
            _selectedOption[buttonIndex] = false;
          }
        }
      });
        },
        isSelected: _selectedOption);
  }
}
