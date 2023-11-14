import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/Category_model.dart';
import 'package:movies_app/models/Movies_model.dart';
import 'package:movies_app/screens/movies_view.dart';


class category_item extends StatelessWidget {

  Genres genres;
  category_item(this.genres);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, movies_view.RouteName,
          arguments:genres,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color:Color(0xffce890a),
          borderRadius: BorderRadius.circular(25)
        ),
        alignment: Alignment.center,
        height: 100,
        width: 100,
        child: Text(genres.name??'',
        style: TextStyle(fontSize: 23,
        color: Colors.white,
        fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

}
