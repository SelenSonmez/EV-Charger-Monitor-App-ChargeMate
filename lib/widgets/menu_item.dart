import 'package:flutter/material.dart';

import '../navbar/navbar.dart';
import '../screens/charging_sessions.dart';

class MenuItem extends StatelessWidget {
  MenuItem({super.key, required this.icon, required this.text});
  IconData icon;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (text) {
          case "Car Battery":
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Navbar(
                          selectedIndex: 2,
                        )));
            break;
          case "ChargeMate Battery":
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Navbar(
                          selectedIndex: 3,
                        )));
            break;
          case "Charging Location":
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Navbar(
                          selectedIndex: 4,
                        )));
            break;
          case "Charging Session":
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChargingSessions()));
            break;
          default:
        }
      },
      child: Container(
          width: 135,
          height: 147,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          padding: const EdgeInsets.all(15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  shadows: const [
                    Shadow(
                      blurRadius: 3,
                      offset: Offset.infinite,
                    ),
                    Shadow(blurRadius: 3),
                  ],
                  size: 75,
                  color: Colors.grey,
                ),
                Text(text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15)),
              ])),
    );
  }
}
