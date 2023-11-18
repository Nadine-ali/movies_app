import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/layout/home_layout/home_screen.dart';
import 'package:movies_app/screens/home_view.dart';

class splash_screen extends StatelessWidget {
  const splash_screen({super.key});
  static const String RouteName="splash_screen";
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, home_screen.RouteName);
    });
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(child: Image.asset("assets/images/movies.png")),
    );
  }
}
