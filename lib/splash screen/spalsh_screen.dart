import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tabour_users/auth/auth_screen.dart';
import 'package:tabour_users/global/global.dart';
import 'package:tabour_users/mainscreens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 8), () async {
      // if seller is logged in already
      if (firebaseAuth.currentUser != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => HomeScreen(
                      sellerUID: firebaseAuth.currentUser!.uid,
                    )));
        // if seller is not logged in
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const AuthScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
          colors: [Colors.amber, Colors.cyan],
        ),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset("images/welcome.png"),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              "Order anything from anywhere in the world! with Tabour",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Train",
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
          )
        ],
      )),
    ));
  }
}
