import 'package:flutter/material.dart';
import 'package:movies_app/layout/home_layout/home_screen.dart';
import 'package:movies_app/screens/category_view.dart';

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
        initialRoute:home_screen.RouteName,
      routes: {
          home_screen.RouteName:(context)=>home_screen(),
          categor_view.Routename:(context)=>categor_view(),
      },
    );


  }
}