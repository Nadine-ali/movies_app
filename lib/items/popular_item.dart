import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/popular_model.dart';

class popular_item extends StatelessWidget {

  List<Results> results;
  int index;
  popular_item(this.results,this.index);
  @override
  Widget build(BuildContext context) {
    return Image.network(results[index].backdropPath??"",
    height: 300,
    width: 200,
    fit: BoxFit.cover,
    );

  }
}
