import 'package:dji/models/drone_model.dart';
import 'package:dji/utils/app_config.dart';
import 'package:dji/utils/constants.dart';
import 'package:dji/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DroneDetailScreen extends StatefulWidget {
  final Drone drone;

  const DroneDetailScreen({Key key, this.drone}) : super(key: key);

  @override
  _DroneDetailScreenState createState() => _DroneDetailScreenState();
}

class _DroneDetailScreenState extends State<DroneDetailScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final appBar = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 3,
              bottom: SizeConfig.blockSizeVertical * 1,
              left: SizeConfig.blockSizeHorizontal * 4,
            ),
            child: Image.asset(
              AvailableIcons.backIcon["assetPath"],
              height: SizeConfig.blockSizeVertical * 1,
              width: SizeConfig.blockSizeHorizontal * 6,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 3,
            bottom: SizeConfig.blockSizeVertical * 1,
            right: SizeConfig.blockSizeHorizontal * 4,
          ),
          child: Image.asset(
            AvailableIcons.menuIcon["assetPath"],
            height: SizeConfig.blockSizeVertical * 2,
            width: SizeConfig.blockSizeHorizontal * 5,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockSizeVertical * 1,
            horizontal: SizeConfig.blockSizeHorizontal * 3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              appBar,
              Container(
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 20,
                  bottom: SizeConfig.blockSizeVertical * 1,
                  left: SizeConfig.blockSizeHorizontal * 1,
                ),
                child: Hero(
                  tag: widget.drone.droneName,
                  child: Image.asset(
                    widget.drone.droneImage,
                    // height: SizeConfig.blockSizeVertical * 25,
                    width: SizeConfig.blockSizeHorizontal * 75,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 1,
                  horizontal: SizeConfig.blockSizeHorizontal * 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      capitalize(widget.drone.droneName),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 25.0,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.drone.droneDescription,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17.0,
                          letterSpacing: 1.0),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      widget.drone.dronePrice,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 3,
                  bottom: SizeConfig.blockSizeVertical * 5,
                  left: SizeConfig.blockSizeHorizontal * 4,
                  right: SizeConfig.blockSizeHorizontal * 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "QTY",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: SizeConfig.blockSizeVertical * 2.5,
                          width: SizeConfig.blockSizeHorizontal * 10,
                          child: OutlineButton(
                            color: Colors.blueGrey,
                            disabledBorderColor: Colors.blueGrey,
                            child: Text(
                              _quantity.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: null,
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                              width: 2,
                            ),
                            shape: StadiumBorder(),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          icon: Icon(
                            FlutterIcons.add_circle_outline_mdi,
                            color: Colors.blueGrey,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () => setState(() => _quantity++),
                        )
                      ],
                    ),
                    OutlineButton(
                      color: Colors.black,
                      disabledBorderColor: Colors.black,
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      onPressed: null,
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      shape: StadiumBorder(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
