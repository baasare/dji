import 'dart:async';

import 'package:dji/routes/routes.dart';
import 'package:dji/utils/app_config.dart';
import 'package:dji/utils/colors.dart';
import 'package:dji/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _walkThroughSeen;
  bool _hasSeenWalkThrough = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    _walkThroughSeen = myPrefs.getBool(SavedPreferencesKeys.seenWalkThroughKey);

    if (_walkThroughSeen == null || _walkThroughSeen == false) {
      setState(() {
        _hasSeenWalkThrough = false;
      });
      print("USER HAS NOT SEEN WALK THROUGH");
    } else {
      print("USER HAS SEEN WALK THROUGH");
    }

    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          walkThroughViewRoute, (Route<dynamic> route) => false);

      if (_hasSeenWalkThrough) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            welcomeViewRoute, (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            walkThroughViewRoute, (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: purplePrimary,
      body: Container(
        color: purplePrimary,
        height: SizeConfig.blockSizeVertical * 100,
        width: SizeConfig.blockSizeHorizontal * 100,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(
                  SizeConfig.blockSizeHorizontal * 30,
                ),
                child: Image.asset(
                  AvailableImages.appLogo["assetPath"],
                  height: SizeConfig.blockSizeVertical * 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
