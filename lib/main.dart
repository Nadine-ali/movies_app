import 'package:flutter/material.dart';
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
        initialRoute: categor_view.Routename,
      routes: {
          categor_view.Routename:(context)=>categor_view(),
      },
    );


  }
}