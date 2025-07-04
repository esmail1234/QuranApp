import 'package:flutter/material.dart';
import 'package:flutter_project/homescreen.dart';
import 'package:flutter_project/mythemedata.dart';
import 'package:flutter_project/surahdetailsscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routname,
      routes: {
        HomeScreen.routname: (context) => HomeScreen(),
        SurahDetailsScreen.routname: (context) => SurahDetailsScreen(),
      },

      theme: Mythemedata.lightTheme,
    );
  }
}
