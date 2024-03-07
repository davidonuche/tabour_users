import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tabour_users/global/global.dart';

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
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (c) => const HomeScreen()));
        // if seller is not logged in
      } else {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (c) => const AuthScreen()));
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
      color: Colors.white,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset("images/splash.jpg"),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              "Sell Anything Online",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontFamily: "Signatra",
                color: Colors.black54,
                letterSpacing: 3,
              ),
            ),
          )
        ],
      )),
    ));
  }
}
