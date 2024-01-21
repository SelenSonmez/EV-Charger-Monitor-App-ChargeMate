import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/register_screen.dart';

class AuthenticationText extends StatelessWidget {
  const AuthenticationText(
      {super.key, required this.question, required this.buttonText});
  final String question;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question, style: GoogleFonts.poppins()),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()));
            },
            child: Text(
              buttonText,
              style: GoogleFonts.poppins(),
            )),
      ],
    );
  }
}
