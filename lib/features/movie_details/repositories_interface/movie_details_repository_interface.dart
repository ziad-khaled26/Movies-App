import 'package:dartz/dartz.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response/movie_details.dart';

abstract class MoviesDetailsRepositoryInterface{
  Future<Either<String,MovieDetails>> getMovieDetails(int movieId);
  Future<Either<String,List<Movie>>> getMovieSuggestions(int movieId);

}