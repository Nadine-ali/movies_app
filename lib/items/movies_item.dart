import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/Movies_model.dart';
import 'package:movies_app/models/popular_model.dart';

class movies_item extends StatelessWidget {

  Results results;
  movies_item(this.results);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.network(results.backdropPath ?? '',
              width: 150,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                child: Text("""${results.title??''}""",
                  // overflow:TextOverflow.ellipsis,
                  // maxLines: 1,
                  style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,

                ),),
              ),
              Text(results.originalLanguage??'',style: TextStyle(
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
