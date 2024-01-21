import 'dart:convert';

import 'package:charge_mate/background.dart';
import 'package:charge_mate/screens/services/firebase_service.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:charge_mate/screens/login_screen.dart';
import 'package:charge_mate/widgets/charge_button.dart';
import 'package:charge_mate/widgets/charge_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  String message = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 0.1.sh),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(
                    thickness: 3,
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  Text(
                    "Create New Account",
                    style: GoogleFonts.poppins(
                        fontSize: 22.spMax,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  ChargeTextField(
                    controller: _nameController,
                    icon: Icons.person,
                    label: "Name",
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  ChargeTextField(
                    controller: _emailController,
                    icon: Icons.mail,
                    label: "E-mail",
                    validator: (value) {
                      return "sdsadsd";
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  ChargeTextField(
                    isPassword: true,
                    controller: _passwordController,
                    icon: Icons.password,
                    label: "Password",
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  ChargeTextField(
                    controller: _numberController,
                    icon: Icons.numbers,
                    label: "Phone Number",
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  chargeButton(context, "SIGN UP", () async {
                    String encryptedPassword =
                        encryptPassword(_passwordController.text);

                    message = await FirebaseService().createUser(
                        _nameController.text,
                        _numberController.text,
                        _emailController.text,
                        encryptedPassword);

                    if (!(message == "success")) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Email Already Used")));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LoginScreen()));
                    }
                  }),
                  SizedBox(
                    height: 0.08.sh,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Already have an account?',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              text: '   Sign In',
                              style: GoogleFonts.poppins(
                                  color: Colors.black, fontSize: 16),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                })
                        ]),
                  ),
                ],
              ),
            ),
          )),
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
