import 'package:charge_mate/screens/car_battery.dart';
import 'package:charge_mate/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screens/chargeMate_battery.dart';
import '../screens/glow.dart';
import '../screens/map.dart';

class Navbar extends StatefulWidget {
  Navbar({super.key, required this.selectedIndex});
  int selectedIndex = 0;

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  static final List<Widget> _widgetOptions = <Widget>[
    Glow(),
    const MenuScreen(),
    const BatteryScreen(),
    const CarBatteryScreen(),
    ChargeMateMap()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(widget.selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(221, 22, 22, 22),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.black12,
              hoverColor: Colors.black,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.black26,
              color: Colors.black,
              tabs: const [
                GButton(
                  iconSize: 25,
                  iconColor: Colors.white,
                  icon: FontAwesomeIcons.bolt,
                ),
                GButton(
                  iconSize: 25,
                  iconColor: Colors.white,
                  icon: FontAwesomeIcons.gasPump,
                ),
                GButton(
                  iconSize: 25,
                  iconColor: Colors.white,
                  icon: FontAwesomeIcons.car,
                ),
                GButton(
                    iconSize: 25,
                    iconColor: Colors.white,
                    icon: FontAwesomeIcons.plug),
                GButton(
                    iconSize: 25,
                    iconColor: Colors.white,
                    icon: FontAwesomeIcons.locationDot),
              ],
              selectedIndex: widget.selectedIndex,
              onTabChange: (index) {
                setState(() {
                  widget.selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
