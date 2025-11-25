import 'package:dartz/dartz.dart';
import 'package:movies/features/movie_details/data/models//movie_details_response/Movie.dart';
import 'package:movies/features/movie_details/data/models/movie_suggesions_response/Movie.dart'as movie_suggestions;

abstract class MoviesDetailsRepositoryInterface{
  Future<Either<String,Movie>> getMovieDetails(int movieId);
  Future<Either<String,List<movie_suggestions.Movie>>> getMovieSuggestions(int movieId);

}