import 'package:charge_mate/background.dart';
import 'package:charge_mate/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Icon(
                  Icons.bolt_outlined,
                  color: Colors.white,
                  size: 200,
                ),
                Text("ChargeMate Inc.",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Column(
              children: [
                Text(
                  "Welcome to ChargeMate Inc.",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Anywhere, anytime.",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
              ],
            ),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(170, 45)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  "Get Started".toUpperCase(),
                  style: GoogleFonts.poppins(),
                ))
          ],
        )),
      ),
    );
  }
}
