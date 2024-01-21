import 'package:charge_mate/screens/services/locations_service.dart';
import 'package:flutter/material.dart';

import '../models/location.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
          child: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: 360,
                  color: Color.fromARGB(255, 118, 119, 119))),
          Positioned(
              top: 120,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: ListView.builder(
                    itemCount: LocationService().locations.length,
                    itemBuilder: (context, index) {
                      Location currentLocation =
                          LocationService().locations[index];
                      return ExpansionTile(
                        childrenPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        tilePadding: EdgeInsets.symmetric(horizontal: 25),
                        subtitle: Row(
                          children: [
                            const Icon(Icons.local_gas_station),
                            Text("${currentLocation.distance} Km"),
                            Text("   ${currentLocation.cableType}"),
                            Text("   ${currentLocation.power} W")
                          ],
                        ),
                        title: Text(currentLocation.name),
                        children: [Text(currentLocation.address)],
                      );
                    }),
              )),
          const Positioned(
            top: 55,
            left: 127,
            child: Icon(
              Icons.bolt,
              size: 120,
            ),
          ),
        ],
      )),
    );
  }
}
