import 'package:charge_mate/background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BatteryScreen extends StatelessWidget {
  const BatteryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "ChargeMate Inc.",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Car Battery",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Image.asset(
                    "assets/katman_station.png",
                  ),
                ],
              ),
              Column(
                children: [
                  Text("%95",
                      style: GoogleFonts.poppins(
                          fontSize: 70,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text(
                    "15 minutes left to full charge...",
                    style:
                        GoogleFonts.poppins(fontSize: 17, color: Colors.white),
                  )
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
