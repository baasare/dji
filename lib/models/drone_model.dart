import 'dart:convert';

Drone droneFromJson(String str) => Drone.fromJson(json.decode(str));

String droneToJson(Drone data) => json.encode(data.toJson());

class Drone {
  Drone({
    this.droneName,
    this.dronePrice,
    this.droneImage,
    this.droneDescription,
  });

  String droneName;
  String dronePrice;
  String droneImage;
  String droneDescription;

  factory Drone.fromJson(Map<String, dynamic> json) => Drone(
    droneName: json["drone_name"],
    dronePrice: json["drone_price"],
    droneImage: json["drone_image"],
    droneDescription: json["drone_description"],
  );

  Map<String, dynamic> toJson() => {
    "drone_name": droneName,
    "drone_price": dronePrice,
    "drone_image": droneImage,
    "drone_description": droneDescription,
  };
}
