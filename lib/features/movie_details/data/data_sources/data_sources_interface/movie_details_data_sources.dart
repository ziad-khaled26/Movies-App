import 'package:dartz/dartz.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response/movie_details.dart';
import 'package:movies/features/movie_details/data/models/movie_suggesions_response/movie_suggested.dart' ;


abstract class MovieDetailsDataSource{
  Future<Either<String,MovieDetails>> getMovieDetails(int movieId);
  Future<Either<String,List<Movie>>> getMovieSuggestions(int movieId);
}