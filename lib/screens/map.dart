import 'package:charge_mate/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/station_info.dart';
import '../widgets/station_info_title.dart';
import 'services/locations_service.dart';

class ChargeMateMap extends StatefulWidget {
  const ChargeMateMap({super.key});

  @override
  State<ChargeMateMap> createState() => _ChargeMateMapState();
}

class _ChargeMateMapState extends State<ChargeMateMap> {
  List<Location> locations = LocationService().locations;
  Location currentLocation = LocationService().locations.first;
  final MapController _controller = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            FlutterMap(
              mapController: _controller,
              options: MapOptions(center: currentLocation.latLong, zoom: 11.2),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                const RichAttributionWidget(
                  showFlutterMapAttribution: false,
                  attributions: [
                    TextSourceAttribution(
                      'ChargeMate',
                    ),
                  ],
                ),
                MarkerLayer(
                  markers: locations
                      .map((e) => Marker(
                            point: e.latLong,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  currentLocation = e;
                                  for (var element in locations) {
                                    element.isActive = false;
                                  }
                                  currentLocation.isActive = true;
                                  _controller.move(
                                      currentLocation.latLong, 11.2);
                                  setState(() {});
                                },
                                child: Icon(
                                  shadows: const [
                                    Shadow(color: Colors.black, blurRadius: 15)
                                  ],
                                  Icons.location_on,
                                  size: 50,
                                  color: e.isActive ? Colors.red : Colors.grey,
                                ),
                              );
                            },
                          ))
                      .toList(),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Positioned(
              top: 30,
              left: 20,
              child: Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(135, 0, 0, 0), blurRadius: 20)
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromRGBO(70, 178, 188, 1)),
                  width: 320,
                  height: 215,
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        StationInfoTitle(currentLocation: currentLocation),
                        Row(
                          children: [
                            const Icon(
                              FontAwesomeIcons.locationDot,
                              color: Colors.red,
                              size: 30,
                              shadows: [Shadow(blurRadius: 7)],
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(currentLocation.address,
                                  style: GoogleFonts.poppins()),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        StationInfo(currentLocation: currentLocation),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
