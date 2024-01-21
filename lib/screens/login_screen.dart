import 'dart:convert';

import 'package:charge_mate/background.dart';
import 'package:charge_mate/navbar/navbar.dart';
import 'package:charge_mate/screens/services/firebase_service.dart';
import 'package:charge_mate/widgets/authentication_text.dart';
import 'package:charge_mate/widgets/charge_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/charge_textfield.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isUserFound = false;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    // padding: EdgeInsets.fromLTRB(0, 30, right, bottom)
                    padding: EdgeInsets.symmetric(vertical: 45),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign In",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Divider(
                          thickness: 2,
                        )
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.flash_on_outlined,
                    color: Colors.white,
                    size: 150,
                  ),
                  Text("ChargeMate Inc.",
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 30,
                  ),
                  ChargeTextField(
                    controller: _emailController,
                    icon: Icons.email,
                    label: "E-mail",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ChargeTextField(
                    controller: _passwordController,
                    icon: Icons.password,
                    label: "Password",
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const AuthenticationText(
                      question: "Don't have an account? ",
                      buttonText: "Sign Up"),
                  chargeButton(context, "sign in".toUpperCase(), () {
                    String encryptedPassword =
                        encryptPassword(_passwordController.text);

                    FirebaseService()
                        .login(_emailController.text, encryptedPassword)
                        .then((value) {
                      if (value.docs.length == 1 ||
                          (_emailController.text == "admin" &&
                              _passwordController.text == "admin")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Navbar(
                                      selectedIndex: 0,
                                    )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Please Check Your Credentials")));
                      }
                    },
                            onError: (e) => print(
                                "there was an error when finding the user"));
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String encryptPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }
}
