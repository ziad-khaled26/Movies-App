import 'package:dartz/dartz.dart';
import 'package:movies/features/mainLayout/home/data/api/api_service.dart';
import 'package:movies/features/mainLayout/home/data/data_sources/data_sources_interface/movies_list_data_source.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';

class MoviesListApiDataSource implements MoviesListDataSource{
  APIService apiService;
  MoviesListApiDataSource({required this.apiService});
  @override
  Future<Either<String, List<Movie>>> getMoviesList() {
    return apiService.getMoviesList();
  }

}