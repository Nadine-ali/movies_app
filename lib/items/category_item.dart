import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/Category_model.dart';

class category_item extends StatelessWidget {

  Genres genres;
  int index;
  category_item(this.genres,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffce890a),
        borderRadius: BorderRadius.circular(25)
      ),
      alignment: Alignment.center,
      height: 100,
      width: 100,
      child: Text(genres.name??'',
      style: TextStyle(fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
