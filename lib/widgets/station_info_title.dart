import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/location.dart';
import '../screens/locations_list.dart';

class StationInfoTitle extends StatelessWidget {
  const StationInfoTitle({
    super.key,
    required this.currentLocation,
  });

  final Location currentLocation;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
          style: IconButton.styleFrom(
              backgroundColor: const Color.fromARGB(141, 173, 235, 238)),
          icon: const Icon(Icons.local_gas_station_rounded),
          onPressed: () {}),
      title: Text(currentLocation.name,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
      trailing: IconButton(
        style: IconButton.styleFrom(
            backgroundColor: const Color.fromARGB(141, 173, 235, 238)),
        icon: const Icon(Icons.list),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LocationsList()));
        },
      ),
    );
  }
}
