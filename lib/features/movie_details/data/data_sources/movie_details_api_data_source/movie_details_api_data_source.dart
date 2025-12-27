import 'package:dartz/dartz.dart';
import 'package:movies/features/mainLayout/home/data/api/api_service.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/movie_details/data/data_sources/data_sources_interface/movie_details_data_sources.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response/movie_details.dart' as movie_details;
import 'package:movies/features/movie_details/data/models/movie_suggesions_response/movie_suggested.dart';

class MovieDetailsApiDataSource implements MovieDetailsDataSource{
  final APIService apiService;
  MovieDetailsApiDataSource({required this.apiService});

  @override
  Future<Either<String, movie_details.MovieDetails>> getMovieDetails(int movieId) {
    return apiService.getMovieDetails(movieId);
  }

  @override
  Future<Either<String,List<Movie>>> getMovieSuggestions(int movieId) {
    return apiService.getMovieSuggestions(movieId);
  }

}