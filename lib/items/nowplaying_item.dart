import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/nowPlaying_model.dart';


class nowplaying_item extends StatelessWidget {

  List<Results> results;
  int index;
  nowplaying_item(this.results,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children:[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(results[index].backdropPath??"",
              height: 300,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 50,
            width: 200,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.only(bottomRight:Radius.circular(20),bottomLeft: Radius.circular(20))
            ),
            alignment: Alignment.center,
            child: Text(results[index].title??'',
            style: TextStyle(
              fontSize: 20,
              overflow:TextOverflow.ellipsis,
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),
            ),
          )
        ]
      ),
    );

  }
}
