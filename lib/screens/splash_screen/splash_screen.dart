import 'dart:async';
import 'package:Foodybite/auth/wrapper.dart';
import 'package:Foodybite/screens/splash_screen/Zig_Zag_Zipper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.redAccent,
        body: new Stack(
          //alignment:new Alignment(x, y)
          children: <Widget>[
            new Positioned(
              child: ClipPath(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  color: Color.fromRGBO(226, 55, 68, 1.0),
                ),
                clipper: ZigZagClipper(),
              ),
            ),
            new Positioned(
              top: 40,
              child: ClipPath(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  color: Color.fromRGBO(226, 55, 68, 0.80),
                ),
                clipper: ZigZagClipper(),
              ),
            ),
            new Positioned(
              top: 80,
              child: ClipPath(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  color: Color.fromRGBO(226, 55, 68, 0.60),
                ),
                clipper: ZigZagClipper(),
              ),
            ),
            new Center(
              child: Image.network(
                "https://raw.githubusercontent.com/Madhav2008/App-Assets/main/Logo4Recipo.png",
                width: 500,
                height: 500,
              )
              // child: Text(
              //   'Recipo',
              //   style: TextStyle(
              //       fontSize: 50,
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //       // fontFamily: "MuseoModerno"
              //   ),
              // ),
              // child: Container(width:200, height:200, child: Image.asset('assets/images/Logo.png'))
            )
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void navigationPage() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    if (token.isEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Wrapper()),
      );
    }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Wrapper()),
      );
    }
  }
}