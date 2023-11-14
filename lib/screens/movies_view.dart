import 'package:flutter/material.dart';
import 'package:movies_app/items/movies_item.dart';
import 'package:movies_app/models/genres_model.dart';
import 'package:movies_app/models/Movies_model.dart';
import 'package:movies_app/shared/network/remote/api_manager.dart';

class movies_view extends StatelessWidget {
  static const String RouteName="movies_view";
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Genres;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        title: Text(args.name??"",style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 25
        ),),
      ),
      backgroundColor: Colors.grey.shade900,
      body: Container(
        child: Column(
          children: [
            FutureBuilder<MoviesResponse>(future: api_manager.getMovies(args.id.toString(),1),
                builder:(context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(snapshot.hasError){
                    Text("something went wrong");
                  }
                  if(snapshot.data?.results==null){
                    return Center(
                      child: Text(snapshot.data?.status_message??"errorrrrr",
                        style: TextStyle(color: Colors.white),),
                    );
                  }
                  var moviesList=snapshot.data?.results??[];
                  return
                    Expanded(
                    child: ListView.builder(
                      itemCount: moviesList.length,
                      itemBuilder:(context, index) {
                        return movies_item(moviesList[index]);
                      },),
                    );
                  }
                  ,)

          ],
        ),
      ),
    );
  }
}
