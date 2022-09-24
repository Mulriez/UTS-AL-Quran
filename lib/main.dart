// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:uts_alquran/detailsurat.dart';
import 'package:uts_alquran/quranlist.dart';
import 'package:uts_alquran/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Al-Quran ku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

       primarySwatch: Colors.cyan
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/splashScreen',
      routes: {
        // ignore: prefer_const_constructors
        '/splashScreen': (context) => SplashScreen(),

        // ignore: prefer_const_constructors
        '/': (context) => Alquran(title: 'السلام عليكم '),
        '/alBaqoroh':(context) => AlBaqoroh(),
      }
    );

  }
}