import 'package:flutter/material.dart';
import 'package:movies_app/layout/home_layout/home_screen.dart';
import 'package:movies_app/screens/genres_view.dart';
import 'package:movies_app/screens/movies_view.dart';
import 'package:movies_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:splash_screen.RouteName,
      routes: {
          home_screen.RouteName:(context)=>home_screen(),
          genres_view.Routename:(context)=>genres_view(),
          movies_view.RouteName:(context)=>movies_view(),
          splash_screen.RouteName:(context)=>splash_screen(),
      },
    );


  }
}