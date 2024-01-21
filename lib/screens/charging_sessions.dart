import 'package:charge_mate/background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChargingSessions extends StatelessWidget {
  const ChargingSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "ChargeMate Inc.",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ChargeCard(
                        date: "10 Jan 2024 13:00",
                        watt: "10 W",
                        total: "100 ₺",
                        duration: "05.30"),
                    ChargeCard(
                        date: "12 Feb 2024 15:00",
                        watt: "30 W",
                        total: "300 ₺",
                        duration: "19.32"),
                    ChargeCard(
                        date: "23 Oct 2023 12:00",
                        watt: "50 W",
                        total: "350 ₺",
                        duration: "12.42"),
                    ChargeCard(
                        date: "17 Dec 2023 21:00",
                        watt: "40 W",
                        total: "400 ₺",
                        duration: "16.20"),
                    ChargeCard(
                        date: "17 Dec 2023 21:00",
                        watt: "40 W",
                        total: "400 ₺",
                        duration: "16.20"),
                  ],
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class ChargeCard extends StatelessWidget {
  ChargeCard(
      {super.key,
      required this.date,
      required this.watt,
      required this.total,
      required this.duration});
  String date;
  String watt;
  String total;
  String duration;
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Date:"), Text(date)],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.timelapse,
                          shadows: [Shadow(color: Colors.black)],
                          size: 25,
                          color: Color.fromARGB(255, 21, 176, 219)),
                      Text(duration)
                    ],
                  ),
                  Column(
                    children: [const Text("Consumed W"), Text(watt)],
                  ),
                  Column(
                    children: [
                      const Text("Total"),
                      Text(total),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 30,
                  width: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 21, 176, 219),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "Completed",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
