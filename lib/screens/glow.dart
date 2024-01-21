import 'package:charge_mate/background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Glow extends StatefulWidget {
  @override
  _GlowState createState() => _GlowState();
}

class _GlowState extends State<Glow> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation setup
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..repeat();

    _animation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(tween: Tween(begin: 1.0, end: 2.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 2.0, end: 1.0), weight: 1),
      ],
    ).animate(_animationController);
  }

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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.0),
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
                    indent: 30,
                    endIndent: 30,
                    thickness: 3,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Stack(
                      children: [
                        Image.asset("assets/ring.png"),
                        Positioned(
                          left: 40,
                          top: 50,
                          child: Container(
                            width: 282,
                            height: 282,
                            decoration: BoxDecoration(
                              // color: Color.fromRGBO(78, 223, 215, 0.3),
                              // borderRadius: BorderRadius.circular(100),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10, color: Colors.transparent),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromRGBO(78, 223, 215, 0.5),
                                  blurRadius: 13 * _animation.value,
                                  spreadRadius: 22 * _animation.value,
                                ),
                                BoxShadow(
                                  color:
                                      const Color.fromRGBO(15, 153, 165, 0.71),
                                  blurRadius: 5 * _animation.value,
                                  spreadRadius: 9 * _animation.value,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 47,
                          left: 39,
                          child: Container(
                            width: 285,
                            height: 285,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(23, 192, 208, 0.71),
                                  width: 3,
                                  strokeAlign: BorderSide.strokeAlignInside),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, blurRadius: 7),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 45,
                          left: 37,
                          child: Container(
                            width: 289,
                            height: 289,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                  strokeAlign: BorderSide.strokeAlignInside),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 22,
                          child: Container(
                            width: 320,
                            height: 300,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(19, 159, 171, 0.71),
                                  width: 4,
                                  strokeAlign: BorderSide.strokeAlignInside),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 91,
                          top: 135,
                          child: Text(
                            textAlign: TextAlign.center,
                            "Start \nCharging".toUpperCase(),
                            style: GoogleFonts.poppins(
                                fontSize: 34, color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
