import 'package:flutter/material.dart';
import 'package:movies_app/items/movies_item.dart';
import 'package:movies_app/shared/network/remote/api_manager.dart';

import '../items/search_item.dart';

class search_view extends StatefulWidget {

  @override
  State<search_view> createState() => _search_viewState();
}

class _search_viewState extends State<search_view> {
  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              searchController.text;
              setState(() {

              });
            },
            controller: searchController,
            style: TextStyle(
              color: Color(0xffce890a),
              fontSize: 20,
            ),
            decoration:
            InputDecoration(
              hintText: "enter movie name",
              hintStyle: TextStyle(
                color:Colors.white54,
               fontSize: 15
              ),
              suffixIcon:Icon(Icons.search,color:Color(0xffce890a),size: 35,),
              focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Color(0xffce890a)
                )
              ) ,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.white70)
              ) ,
            ),
          ),
          Column(
            children: [
              FutureBuilder(
                future:api_manager.search(searchController.text),
                builder:(context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(snapshot.hasError){
                    Text("something went wrong");
                  }
                  if(snapshot.data?.results==null){
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(snapshot.data?.status_message??"no movie found",
                          style: TextStyle(color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    );
                  }
                  var searchList=snapshot.data?.results??[];
                  return
                    Container(
                      height: 300,
                      child: ListView.builder(
                        itemCount: searchList.length,
                        itemBuilder:(context, index) {
                          return search_item(searchList[index]);
                        },),
                    );
                }
                ,)

            ],
          ),

        ],
      ),
    );
  }
}
