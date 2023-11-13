import 'package:flutter/material.dart';
import 'package:movies_app/items/category_item.dart';
import 'package:movies_app/models/Category_model.dart';
import 'package:movies_app/shared/network/remote/api_manager.dart';

class categor_view extends StatelessWidget {
  categor_view({super.key});
  static const Routename="category_view";
  // List<Genres>genres=[];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Browse category",style: TextStyle(
              color: Colors.white,
             fontSize: 30 ,
              fontWeight: FontWeight.bold,
            ),),
            FutureBuilder(
                future: api_manager.getCategory(),
                builder: (context, snapshot) {
               if(snapshot.connectionState==ConnectionState.waiting){
               return Center(child: CircularProgressIndicator(),);
               }
               if(snapshot.hasError){
               Text("something went wrong ");
               }
               if(snapshot.data?.genres==null){
               return Center(child: Text(snapshot.data?.status_message??''),
               );
               }
                var genrelist=snapshot.data?.genres??[];
                  return Expanded(
                    child: GridView.builder(
                      itemCount:genrelist.length,
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16
                      ),
                      itemBuilder:(context, index) {
                        return category_item(genrelist[index],index);
                      },
                    ),
                  );
                },
            ),

          ],
        ),
      );
  }
}
