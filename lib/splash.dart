// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:async';
// ignore: unused_import
import 'dart:ffi';
import 'package:flutter/material.dart';
// ignore: unused_import

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(197, 31, 219, 240),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Center(
            child: Image.asset(
              "assets/images/AlQuran.png",
              width: 300,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 24.0,
          ),
          // ignore: prefer_const_constructors
          Center(
            // ignore: prefer_const_constructors
            child: Text(
              "Al-Quran ku",
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),
          // ignore: prefer_const_constructors
        ],
      ),
    );
  }
}
