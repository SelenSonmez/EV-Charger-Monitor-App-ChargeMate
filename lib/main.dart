import 'package:charge_mate/screens/charging_sessions.dart';
import 'package:charge_mate/screens/glow.dart';
import 'package:charge_mate/screens/login_screen.dart';
import 'package:charge_mate/navbar/navbar.dart';
import 'package:charge_mate/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'screens/locations_list.dart';
import 'screens/map.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1080, 2280),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: TextTheme(
                  bodyLarge: GoogleFonts.poppins(),
                  titleMedium: GoogleFonts.poppins()),
              // scaffoldBackgroundColor: Colors.grey,
              colorScheme: ColorScheme.fromSeed(
                  primary: Colors.black, seedColor: Colors.grey),
              useMaterial3: true,
            ),
            home: LoginScreen(),
          );
        });
  }
}
