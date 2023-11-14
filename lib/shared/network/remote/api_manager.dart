import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:movies_app/models/Movies_model.dart';
import '../../../models/Category_model.dart';
class api_manager{
  static Future<CategoryResponse>getCategory()async{
  Uri URL=Uri.https(
   "api.themoviedb.org",
    "3/genre/movie/list",
    {"api_key":"162838abd2fe2174b35f14eebc3b4c07"}
  );
  http.Response response=await http.get(URL);
  var jsonData=jsonDecode(response.body);
  CategoryResponse categoryResponse=CategoryResponse.fromJson(jsonData);
  return categoryResponse;
  }
  static Future<MoviesResponse>getMovies(int? genre_ids)async{
    Uri URL=Uri.https(
        "api.themoviedb.org",
        "3/discover/movie",
        {"api_Key":"162838abd2fe2174b35f14eebc3b4c07",
          "page":"1",
          "genre_ids":genre_ids
        }
    );
    http.Response response=await http.get(URL);
    var jsonData=jsonDecode(response.body);
    MoviesResponse moviesResponse=MoviesResponse.fromJson(jsonData);
    return moviesResponse;
  }
}