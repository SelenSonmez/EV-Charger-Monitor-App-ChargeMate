import 'package:charge_mate/background.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/menu_item.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                Image.asset(
                  "assets/katman_home.png",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuItem(
                      icon: Icons.battery_charging_full,
                      text: "Car Battery",
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    MenuItem(
                      icon: FontAwesomeIcons.suitcaseRolling,
                      text: "ChargeMate Battery",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuItem(
                      icon: Icons.location_on,
                      text: "Charging Location",
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    MenuItem(
                      icon: FontAwesomeIcons.clock,
                      text: "Charging Session",
                    ),
                  ],
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
