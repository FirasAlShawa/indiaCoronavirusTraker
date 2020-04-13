import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:flutter_rounded_progress_bar/flutter_icon_rounded_progress_bar.dart';

void main() => runApp(MyApp());

const double headerTopMargin = 70.0;
const double buttonBottomMargin = 40.0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CrononaVirus Tracker',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainContainer(),
    );
  }
}

class mainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff417a69),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0.1,
                    1
                  ],
                  colors: [
                    const Color(0xff308a6e),
                    const Color(0xff67af99),
                  ]),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            margin: EdgeInsets.only(bottom: buttonBottomMargin),
            padding: EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Header(),
                SizedBox(
                  height: 25.0,
                ),
                Cards()
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              right: 100,
              left: 100,
              top: 15,
              bottom: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffddede3),
            ),
            child: Text(
              "Cumlative",
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0xff4c7b6c),
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      margin: EdgeInsets.only(top: headerTopMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "India\nCoronavirus\nTraker",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway Bold",
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "6 APRIL, 2020",
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: 125.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  Widget infoCard(
      {String word,
      String value,
      String imageName,
      double percent,
      Color primaryColor,
      Color secondaryColor}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: Color.fromARGB(255, 242, 244, 243),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          height: 180.0,
          width: 140.0,
          padding: EdgeInsets.all(8.0),
          color: Color.fromARGB(255, 242, 244, 243),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(
                height: 50.0,
                image: AssetImage("images/$imageName"),
              ),
              Text(
                "$value",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              Text(
                "$word",
                style: TextStyle(
                  fontSize: 18.0,
                  color: primaryColor,
                ),
              ),
              RoundedProgressBar(
                style: RoundedProgressBarStyle(
                  borderWidth: 0,
                  widthShadow: 0,
                  colorProgress: primaryColor,
                  backgroundProgress: secondaryColor,
                ),
                borderRadius: BorderRadius.circular(24),
                percent: percent,
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            infoCard(
              word: "Recovered",
              value: "206",
              percent: 15,
              imageName: "topLeft.png",
              primaryColor: Color(0xff519f87),
              secondaryColor: Color(0xffcfe9e0),
            ),
            infoCard(
              word: "Confirmed",
              value: "2897",
              percent: 35,
              imageName: "topRight.png",
              primaryColor: Color(0xffed5f70),
              secondaryColor: Color(0xfff6dfe2),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            infoCard(
              word: "Deceased",
              value: "75",
              percent: 5,
              imageName: "bottomLeft.png",
              primaryColor: Color(0xff818382),
              secondaryColor: Color(0xffe7e7e7),
            ),
            infoCard(
              word: "Active",
              value: "2616",
              percent: 30,
              imageName: "bottomRight.png",
              primaryColor: Color(0xff5e9ee2),
              secondaryColor: Color(0xff90bef0),
            ),
          ],
        )
      ],
    );
  }
}
