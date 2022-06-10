import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quotes_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff1132D9), Color(0xFF02F993)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/lottie/quotes.json",
                  height: 150, width: 150),
              // Image.asset(
              //   "assets/images/quotes1.png",
              //   height: 150,
              //   width: 150,
              // ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Quotes World !",
                style: TextStyle(
                    fontFamily: 'Raleway',
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
