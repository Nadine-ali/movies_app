import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:movies_app/models/Movies_model.dart';
import '../../../models/genres_model.dart';
class api_manager{
  static Future<GenresResponse>getCategory()async{
  Uri URL=Uri.https(
   "api.themoviedb.org",
    "/3/genre/movie/list",
    {"api_key":"162838abd2fe2174b35f14eebc3b4c07",
    "language":"en"

    }
  );
  http.Response response=await http.get(URL);
  var jsonData=jsonDecode(response.body);
  GenresResponse genresResponse=GenresResponse.fromJson(jsonData);
  return genresResponse;
  }
  static Future<MoviesResponse>getMovies(String genre_id, int page)async{
    Uri URL=Uri.https(
        "api.themoviedb.org",
        "/3/discover/movie",
        {"api_key":"162838abd2fe2174b35f14eebc3b4c07",
          "include_adult":"false",
          "include_video":"false",
          "language":"en-US",
          "with_genres":genre_id,
          "page":page,
        });
    http.Response response=await http.get(URL);
    var jsonData=jsonDecode(response.body);
    MoviesResponse moviesResponse=MoviesResponse.fromJson(jsonData);
    return moviesResponse;
  }
}