import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quotes_app/ad_service/ad_service.dart';
import 'package:quotes_app/view/english_quotes.dart';
import 'package:quotes_app/view/gujarati_quotes.dart';
import 'package:quotes_app/view/hindi_quotes.dart';
import 'package:quotes_app/view/kannada_quotes.dart';
import 'package:quotes_app/view/malayalam_quotes.dart';
import 'package:quotes_app/view/marathi_quotes.dart';
import 'package:quotes_app/view/tamil_quotes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InterstitialAd? _interstitialAd;

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialAd = null;
          _createInterstitialAd();
          log("interstitial======>$error");
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
    }
  }

  @override
  void initState() {
    super.initState();

    _createInterstitialAd();
  }

  @override
  void dispose() {
    super.dispose();

    _interstitialAd?.dispose();
  }

  List<dynamic> gradientColor1 = [
    0xff2753F3,
    0xff0EBE7E,
    0xffFE7F44,
    0xffFF484C,
    0xff2753F3,
    0xffFF3D00,
    0xff11493E,
  ];
  List<dynamic> gradientColor2 = [
    0xff765AFC,
    0xff07D9AD,
    0xffFFCF68,
    0xffFF6C60,
    0xff2753F3,
    0xffFF6E40,
    0xff00CCCB,
  ];

  List<String> categoryTitle = [
    "English",
    "Hindi",
    "Gujarati",
    "Marathi",
    "Tamil",
    "Kannada",
    "Malayalam",
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.blue.shade200
            // gradient: LinearGradient(colors: [
            //   Colors.blue.shade600,
            //   //Colors.white,
            //   //Colors.white54,
            //   Colors.indigo.shade600
            // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                FadeInLeft(
                  child: Text(
                    "Welcome to the Quotes World !",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 40),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                FadeInRight(
                    child: Text(
                  "Get Unique and Wonderful Quotes !",
                  style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: screenSize.height * 0.04,
                ),
                Text(
                  "Select the Language of Quotes:",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Column(
                  children: List.generate(
                    7,
                    (index) => GestureDetector(
                      onTap: () {
                        _showInterstitialAd();
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EnglishQuotes(),
                            ),
                          );
                        } else if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HindiQuotes(),
                            ),
                          );
                        } else if (index == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GujaratiQuotes(),
                            ),
                          );
                        } else if (index == 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MarathiQuotes(),
                            ),
                          );
                        } else if (index == 4) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TamilQuotes(),
                            ),
                          );
                        } else if (index == 5) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => KannadaQuotes(),
                            ),
                          );
                        } else if (index == 6) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MalayalamQuotes(),
                            ),
                          );
                        }
                      },
                      child: FadeInUpBig(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 7),
                          height: screenSize.height * 0.066,
                          width: screenSize.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(gradientColor1[index]),
                                Color(gradientColor2[index]),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              categoryTitle[index],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
