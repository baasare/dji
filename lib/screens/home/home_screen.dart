import 'package:dji/utils/app_config.dart';
import 'package:dji/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image(
              image: _currentIndex == 0
                  ? AvailableIcons.homeActive["assetImage"]
                  : AvailableIcons.homeInActive["assetImage"],
              height: SizeConfig.blockSizeVertical * 3,
              width: SizeConfig.blockSizeHorizontal * 5,
            ),
            label: "",
          ),
        ],
      ),
      body: [
        // FirstScreen(),
      ][_currentIndex],
    );
  }
}
