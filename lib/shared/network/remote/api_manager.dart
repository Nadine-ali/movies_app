import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:movies_app/models/Movies_model.dart';
import '../../../models/Category_model.dart';
class api_manager{
  static Future<CategoryResponse>getCategory()async{
  Uri URL=Uri.https(
   "api.themoviedb.org",
    "/3/genre/movie/list",
    {"api_key":"162838abd2fe2174b35f14eebc3b4c07",
    "language":"en"

    }
  );
  http.Response response=await http.get(URL);
  var jsonData=jsonDecode(response.body);
  CategoryResponse categoryResponse=CategoryResponse.fromJson(jsonData);
  return categoryResponse;
  }
  static Future<MoviesResponse>getMovies(String genre_id)async{
    Uri URL=Uri.https(
        "api.themoviedb.org",
        "/3/discover/movie",
        {"apiKey":"162838abd2fe2174b35f14eebc3b4c07",
         "with_genres":genre_id,
         "page":1,
        });
    http.Response response=await http.get(URL);
    var jsonData=jsonDecode(response.body);
    MoviesResponse moviesResponse=MoviesResponse.fromJson(jsonData);
    return moviesResponse;
  }
}