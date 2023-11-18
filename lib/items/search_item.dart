import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:movies_app/models/Movies_model.dart';
import 'package:movies_app/models/Search_model.dart';

class search_item extends StatelessWidget {

  Results results;
  search_item(this.results,);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(results.backdropPath ?? '',
                width: 150,
                height: 250,
                fit: BoxFit.cover,

              ),
            ),
          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              Container(
                width: 170,
                child: Text("""${results.title??''}""",
                  style: TextStyle(
                  // overflow: TextOverflow.ellipsis,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,

                ),),
              ),
              SizedBox(height: 12,),
              Text(results.originalLanguage??'',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.star,color: Colors.green,size: 20,),
                  Text(results.voteAverage.toString()??'',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),),
                ],
              ) ,
              SizedBox(height: 10,),
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
