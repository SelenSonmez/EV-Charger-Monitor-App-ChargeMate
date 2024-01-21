import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/location.dart';

class StationInfo extends StatelessWidget {
  const StationInfo({
    super.key,
    required this.currentLocation,
  });

  final Location currentLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text("Distance", style: GoogleFonts.poppins(color: Colors.white)),
            Text(currentLocation.distance, style: GoogleFonts.poppins()),
          ],
        ),
        Column(
          children: [
            Text("Cable Type", style: GoogleFonts.poppins(color: Colors.white)),
            Text(currentLocation.cableType, style: GoogleFonts.poppins())
          ],
        ),
        Column(
          children: [
            Text("Power", style: GoogleFonts.poppins(color: Colors.white)),
            Text(currentLocation.power, style: GoogleFonts.poppins())
          ],
        ),
      ],
    );
  }
}
