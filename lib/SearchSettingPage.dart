import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchSettingPage extends StatefulWidget {
  @override
  _SearchSettingPage createState() => _SearchSettingPage();
}

class _SearchSettingPage extends State<SearchSettingPage> {
  final List<bool> _selectedOption = <bool>[false, false, false];
  var startDate = '선택';
  var endDate = '선택';
  var mertro = '광역시/도';
  var city = '시/군/구';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.06),
            ),
            Row(children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.arrow_back,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.24),
                  child: Text(
                    '검색 설정',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Merri_Weather',
                        fontWeight: FontWeight.w800),
                  )),
            ]),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.023,
                left: MediaQuery.of(context).size.width * 0.03,
              ),
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
                left: MediaQuery.of(context).size.width * 0.03,
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
                    width: MediaQuery.of(context).size.width * 0.655,
                    height: MediaQuery.of(context).size.height * 0.044,
                    child: OutlinedButton(
                      onPressed: () {
                        datePicker(1);
                      },
                      child: Text(
                        startDate,
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
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 5),
                    child: Text(
                      '부터',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Merri_Weather',
                        fontWeight: FontWeight.w700,
                        color: Color(0xff878787),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.015,
                left: MediaQuery.of(context).size.width * 0.125,
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.055),
                    width: MediaQuery.of(context).size.width * 0.655,
                    height: MediaQuery.of(context).size.height * 0.044,
                    child: OutlinedButton(
                      onPressed: () {
                        datePicker(2);
                      },
                      child: Text(
                        endDate,
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
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 5),
                    child: Text(
                      '까지',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Merri_Weather',
                        fontWeight: FontWeight.w700,
                        color: Color(0xff878787),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.023,
                  left: MediaQuery.of(context).size.width * 0.03,
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
                    mertoSelect(),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.023,
                left: MediaQuery.of(context).size.width * 0.068,
              ),
              child: citySelect(),
            ),
            Spacer(),
            participateBtn(context)
          ],
        ),
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
            fontSize: 14),
        color: Color(0xff878787),
        disabledBorderColor: Colors.amber,
        disabledColor: Colors.white,
        fillColor: Colors.white,
        selectedColor: Color(0xff00A1E9),
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

  Future datePicker(int check) async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2023, 1, 1));
    if (check == 1) {
      if (dateTime != null)
        setState(() {
          startDate = dateTime.toString();
        });
      else {
        setState(() {
          startDate = '선택';
        });
      }
    } else {
      if (dateTime != null)
        setState(() {
          endDate = dateTime.toString();
        });
      else {
        setState(() {
          endDate = '선택';
        });
      }
    }
  }

  Widget mertoSelect() {
    List<String> metroList = ['광역시/도', '1', '2', '3', '4'];
    String metroSelected = "광역시/도";
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.055),
      width: MediaQuery.of(context).size.width * 0.72,
      height: MediaQuery.of(context).size.height * 0.044,
      child: DropdownButtonFormField<String?>(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD6D6D6))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD6D6D6))),
        ),
        value: metroSelected,
        items: metroList.map((String item) {
          return DropdownMenuItem<String>(
            child: Text(
              '$item',
              style: TextStyle(fontSize: 14, color: Color(0xff878787)),
            ),
            value: item,
          );
        }).toList(),
        onChanged: (dynamic value) {
          setState(() {
            metroSelected = value;
          });
        },
      ),
    );
  }

  Widget citySelect() {
    List<String> cityList = ['시/군/구', '1', '2', '3', '4'];
    String citySelected = "시/군/구";
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.055),
      width: MediaQuery.of(context).size.width * 0.72,
      height: MediaQuery.of(context).size.height * 0.044,
      child: DropdownButtonFormField<String?>(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD6D6D6))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD6D6D6))),
        ),
        value: citySelected,
        items: cityList.map((String item) {
          return DropdownMenuItem<String>(
            child: Text(
              '$item',
              style: TextStyle(fontSize: 14, color: Color(0xff878787)),
            ),
            value: item,
          );
        }).toList(),
        onChanged: (dynamic value) {
          setState(() {
            citySelected = value;
          });
        },
      ),
    );
  }

  Widget participateBtn(BuildContext context) {
    return  Container(
        margin: EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width * 0.42,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
          },
          child: Text(
            "검색하기",
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
}
