import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:movies/features/mainLayout/home/data/models/Movies_list_response.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response/Movie.dart' as movie_details;
import 'package:movies/features/movie_details/data/models/movie_details_response/Movie_details_response.dart';
import 'package:movies/features/movie_details/data/models/movie_suggesions_response/Movie.dart'as movie_suggestions;
import 'package:movies/features/movie_details/data/models/movie_suggesions_response/Movie_suggesion_response.dart';
class APIService{
  static const String baseUrl="yts.lt";
  static const String listMoviesEndPoint="/api/v2/list_movies.json";
  static const String movieDetailsEndPoint="/api/v2/movie_details.json";
  static const String movieSuggestionsEndPoint="/api/v2/movie_suggestions.json";

  Future<Either<String,List<Movie>>> getMoviesList()async{
    Uri url=Uri.https(
      baseUrl,
      listMoviesEndPoint,
        {
          "order_by":"desc",
          "limit":"40"
        }

    );

    http.Response listMoviesResponse=await http.get(url);
    var json=jsonDecode(listMoviesResponse.body);
    MoviesListResponse moviesListResponse=MoviesListResponse.fromJson(json);
    if(moviesListResponse.status=="error"){
      return left(moviesListResponse.statusMessage??"");
    }else{
      return right(moviesListResponse.data?.movies??[]);
    }

  }


  Future<Either<String,movie_details.Movie> >getMovieDetails(int movieId)async{


    Uri url=Uri.https(
        baseUrl,
        listMoviesEndPoint,
        {
          "movie_id":movieId
        }

    );

    http.Response response=await http.get(url);
    var json=jsonDecode(response.body);
    MovieDetailsResponse movieDetailsResponse=MovieDetailsResponse.fromJson(json);
    if(movieDetailsResponse.status=="error"){
      return left(movieDetailsResponse.statusMessage??"");
    }else{
      return right(movieDetailsResponse.data!.movie!);
    }

  }

  Future<Either<String,List<movie_suggestions.Movie>> >getMovieSuggestions(int movieId)async{


    Uri url=Uri.https(
        baseUrl,
        listMoviesEndPoint,
        {
          "movie_id":movieId
        }

    );

    http.Response response=await http.get(url);
    var json=jsonDecode(response.body);
    MovieSuggestionResponse movieSuggestionResponse=MovieSuggestionResponse.fromJson(json);
    if(movieSuggestionResponse.status=="error"){
      return left(movieSuggestionResponse.statusMessage??"");
    }else{
      return right(movieSuggestionResponse.data?.movies??[]);
    }

  }



}