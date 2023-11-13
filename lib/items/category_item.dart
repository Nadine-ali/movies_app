import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/Category_model.dart';

class category_item extends StatefulWidget {

  Genres genres;
  int index;
  Color color=Color(0xffce890a);
  category_item(this.genres,this.index);

  @override
  State<category_item> createState() => _category_itemState();
}

class _category_itemState extends State<category_item> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.color=Colors.red;
        setState(() {

        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(25)
        ),
        alignment: Alignment.center,
        height: 100,
        width: 100,
        child: Text(widget.genres.name??'',
        style: TextStyle(fontSize: 23,
        color: Colors.white,
        fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
