import 'package:flutter/material.dart';
import 'package:movies_app/screens/genres_view.dart';
import 'package:movies_app/screens/home_view.dart';
import 'package:movies_app/screens/search_view.dart';

class home_screen extends StatefulWidget {
  static const String RouteName = "home_screen";

  home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(

        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade900,
            toolbarHeight: 20,
            elevation: 0,
            // title: Text("Movies App",
            // style: TextStyle(
            //   fontSize: 30,
            //   fontWeight: FontWeight.bold,
            //   color: Color(0xffce890a)
            // ),
            // ),
          ),
          backgroundColor: Colors.grey.shade900,
          body: tabs[selectedindex],
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 30,
            backgroundColor:Colors.grey.shade900,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedItemColor:Color(0xffce890a),
            unselectedItemColor: Colors.white,
            currentIndex: selectedindex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "search"),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation_outlined),
                label: "browse",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.featured_play_list_rounded),
                  label: "watchlist"),
            ],
            onTap: (index) {
              selectedindex = index;
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  List<Widget> tabs = [
    home_view(),
    search_view(),
    genres_view(),

  ];
}