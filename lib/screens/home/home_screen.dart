import 'package:dji/models/drone_model.dart';
import 'package:dji/screens/home/drone_detail_screen.dart';
import 'package:dji/utils/app_config.dart';
import 'package:dji/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // ignore: unused_local_variable
    final dashboard = IconButton(
      icon: Icon(
        Feather.menu,
        size: 30.0,
        color: Colors.black,
      ),
      onPressed: () {
        _scaffoldKey.currentState.openDrawer();
      },
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 3,
                    bottom: SizeConfig.blockSizeVertical * 1,
                    left: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  child: Image.asset(
                    AvailableIcons.menuIcon["assetPath"],
                    height: SizeConfig.blockSizeVertical * 2,
                    width: SizeConfig.blockSizeHorizontal * 5,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 7,
                bottom: SizeConfig.blockSizeVertical * 2,
                left: SizeConfig.blockSizeHorizontal * 4,
              ),
              child: Text(
                "Drones",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 37.0,
                ),
              ),
            ),
            Expanded(child: _dronesListBuilder(context)),
          ],
        ),
      ),
    );
  }

  Widget _dronesListBuilder(BuildContext context) {
    // backing data

    final drones = [
      Drone(
        droneName: "Inspire",
        dronePrice: "GHC 142.66",
        droneImage: AvailableImages.inspire_1["assetPath"],
        droneDescription:
            "Nam ac neque et lacus ornare volutpat. Proin quis consectetur dolor, fringilla dapibus eros. Mauris eget lectus non ex dignissim mattis.",
      ),
      Drone(
        droneName: "Mavic Pro 2",
        dronePrice: "GHC 142.66",
        droneImage: AvailableImages.mavic_1["assetPath"],
        droneDescription:
            "Nam ac neque et lacus ornare volutpat. Proin quis consectetur dolor, fringilla dapibus eros. Mauris eget lectus non ex dignissim mattis.",
      ),
      Drone(
        droneName: "Phantom 2",
        dronePrice: "GHC 142.66",
        droneImage: AvailableImages.phantom_2["assetPath"],
        droneDescription:
            "Nam ac neque et lacus ornare volutpat. Proin quis consectetur dolor, fringilla dapibus eros. Mauris eget lectus non ex dignissim mattis.",
      ),
      Drone(
        droneName: "Phantom 3 SE",
        dronePrice: "GHC 142.66",
        droneImage: AvailableImages.phantom_3_se_1["assetPath"],
        droneDescription:
            "Nam ac neque et lacus ornare volutpat. Proin quis consectetur dolor, fringilla dapibus eros. Mauris eget lectus non ex dignissim mattis.",
      ),
      Drone(
        droneName: "Phantom 4 pro",
        dronePrice: "GHC 142.66",
        droneImage: AvailableImages.phantom_4_pro_1["assetPath"],
        droneDescription:
            "Nam ac neque et lacus ornare volutpat. Proin quis consectetur dolor, fringilla dapibus eros. Mauris eget lectus non ex dignissim mattis.",
      ),
    ];

    return ListView.builder(
      itemCount: drones.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                ctx: context,
                type: PageTransitionType.fade,
                child: DroneDetailScreen(
                  drone: drones[index],
                ),
              ),
            );
          },
          child: Container(
            height: SizeConfig.blockSizeVertical * 27,
            width: SizeConfig.blockSizeHorizontal * 5,
            margin: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 0.7,
              left: SizeConfig.blockSizeHorizontal * 4,
              right: SizeConfig.blockSizeHorizontal * 4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
              color: Colors.grey[200],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 3,
                    bottom: SizeConfig.blockSizeVertical * 1,
                    left: SizeConfig.blockSizeHorizontal * 1,
                  ),
                  child: Hero(
                    tag: drones[index].droneName,
                    transitionOnUserGestures: true,
                    child: Image.asset(
                      drones[index].droneImage,
                      height: SizeConfig.blockSizeVertical * 15,
                      width: SizeConfig.blockSizeHorizontal * 60,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeConfig.blockSizeVertical * 1,
                  ),
                  child: Column(
                    children: [
                      Text(
                        drones[index].droneName,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        drones[index].dronePrice,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
