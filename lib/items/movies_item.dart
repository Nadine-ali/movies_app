import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/Movies_model.dart';

class movies_item extends StatelessWidget {

  Results results;
  movies_item(this.results);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          Image.network(results.backdropPath??'',
            width: 200,
            height: 300,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(results.title??'',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),),
              Text(results.overview??'',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),) ,
              Text(results.releaseDate??'',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xffce890a)
              ),),
            ],
          )
        ],
      ),
    );
  }
}
