import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:movies_app/models/Movies_model.dart';
import 'package:movies_app/models/Search_model.dart';
import 'package:movies_app/models/TopRated_model.dart';
import 'package:movies_app/models/nowPlaying_model.dart';
import 'package:movies_app/models/popular_model.dart';
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

  static Future<PopularResponse>getMovies(String genre_id,int page)async{
    Uri URL=Uri.https(
        "api.themoviedb.org",
        "/3/movie/popular",
        {"api_key":"162838abd2fe2174b35f14eebc3b4c07",
          "include_adult":"false",
          "include_video":"false",
          "language":"en-US",
          "with_genres":"$genre_id",
          "page":"$page",
        });
    http.Response response=await http.get(URL);
    var jsonData=jsonDecode(response.body);
    PopularResponse moviesResponse=PopularResponse.fromJson(jsonData);
    return moviesResponse;
  }

  static Future<PopularResponse>getPopular()async{
    Uri URL=Uri.https(
        "api.themoviedb.org",
        "/3/movie/popular",
        {"api_key":"162838abd2fe2174b35f14eebc3b4c07",
          // "include_adult":"false",
          // "include_video":"false",
          // "language":"en-US",
        });
    http.Response response=await http.get(URL);
    var jsonData=jsonDecode(response.body);
    PopularResponse popularResponse=PopularResponse.fromJson(jsonData);
    return popularResponse;
  }

  static Future<NowPlayingResponse>getNowPlaying()async{
    Uri URL=Uri.https(
        "api.themoviedb.org",
        "/3/movie/now_playing",
        {"api_key":"162838abd2fe2174b35f14eebc3b4c07",
        });
    http.Response response=await http.get(URL);
    var jsonData=jsonDecode(response.body);
    NowPlayingResponse nowPlayingResponse=NowPlayingResponse.fromJson(jsonData);
    return nowPlayingResponse;
  }

  static Future<TopRatedResponse>getTopRated()async{
    Uri URL=Uri.https(
        "api.themoviedb.org",
        "/3/movie/top_rated",
        {"api_key":"162838abd2fe2174b35f14eebc3b4c07",
        });
    http.Response response=await http.get(URL);
    var jsonData=jsonDecode(response.body);
    TopRatedResponse topRatedResponse=TopRatedResponse.fromJson(jsonData);
    return topRatedResponse;
  }

  static Future<SearchResponse>search(String search)async{
    Uri URL=Uri.https(
        "api.themoviedb.org",
        "/3/search/movie",
        {"api_key":"162838abd2fe2174b35f14eebc3b4c07",
          "query":search,
        });
    http.Response response=await http.get(URL);
    var jsonData=jsonDecode(response.body);
    SearchResponse searchResponse=SearchResponse.fromJson(jsonData);
    return searchResponse;
  }

}