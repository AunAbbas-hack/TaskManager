import 'dart:async';

import 'package:aunproject1/FIreBase/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_firebase.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void isLogin(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    if (user != null) {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginFirebase()),
        );
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Firebase",
              style: GoogleFonts.montserrat(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
