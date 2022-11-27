import 'package:eco_wave/LoginPage.dart';
import 'package:eco_wave/MainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x8000A1E9),
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
                onPressed: () {},
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
            maxChildSize: 0.85,
              builder: (BuildContext context, ScrollController scrolController){
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  controller: scrolController,
                  child: Text('dfsdf'),


                ),
              );
              },
          )
        ],
      ),
    );
  }
}
