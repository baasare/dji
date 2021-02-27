import 'dart:async';

import 'package:dji/routes/routes.dart';
import 'package:dji/utils/app_config.dart';
import 'package:dji/utils/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          homeViewRoute, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: SizeConfig.blockSizeVertical * 100,
            child: Image.asset(
              AvailableImages.background["assetPath"],
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 2,
            left: SizeConfig.blockSizeHorizontal * 4,
            child: Container(
              padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5),
              child: Image.asset(
                AvailableImages.appLogo["assetPath"],
                height: SizeConfig.blockSizeVertical * 5,
                width: SizeConfig.blockSizeHorizontal * 15,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 50,
            left: SizeConfig.blockSizeHorizontal * 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "natur.",
                  style: TextStyle(
                    fontSize: 95.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: AvailableFonts.primaryFont,
                  ),
                ),
                Text(
                  "With Dji Mavic Pro",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontFamily: AvailableFonts.primaryFont,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
