import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class Location {
  String name;
  String address;
  String distance;
  String cableType;
  String power;
  bool isActive = false;
  LatLng latLong;

  Location.active(this.name, this.address, this.distance, this.cableType,
      this.power, this.latLong)
      : isActive = true;

  Location(this.name, this.address, this.distance, this.cableType, this.power,
      this.latLong);

  Location active() {
    isActive = true;
    return this;
  }

  @override
  String toString() {
    return "$name $address $distance $cableType $power $latLong $isActive";
  }
}
