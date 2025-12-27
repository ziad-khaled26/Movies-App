import 'package:dartz/dartz.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/movie_details/data/data_sources/data_sources_interface/movie_details_data_sources.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response/movie_details.dart';
import 'package:movies/features/movie_details/data/models/movie_suggesions_response/movie_suggested.dart';
import 'package:movies/features/movie_details/repositories_interface/movie_details_repository_interface.dart';

class MovieDetailsRepositoryImpl implements MoviesDetailsRepositoryInterface{
  final MovieDetailsDataSource dataSource;
  MovieDetailsRepositoryImpl({required this.dataSource});
  @override
  Future<Either<String,MovieDetails>> getMovieDetails(int movieId) {
    return dataSource.getMovieDetails(movieId);
  }

  @override
  Future<Either<String, List<Movie>>> getMovieSuggestions(int movieId) {
    return dataSource.getMovieSuggestions(movieId);
  }

}