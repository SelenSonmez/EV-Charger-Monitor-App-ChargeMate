import 'package:charge_mate/background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarBatteryScreen extends StatelessWidget {
  const CarBatteryScreen({super.key});

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
                          "ChargeMate Battery",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Image.asset(
                    "assets/katman_battery.png",
                  ),
                ],
              ),
              Column(
                children: [
                  Text("%87",
                      style: GoogleFonts.poppins(
                          fontSize: 70,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text(
                    "23 minutes left to full charge...",
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
