import 'package:dartz/dartz.dart';
import 'package:movies/features/mainLayout/home/data/data_sources/data_sources_interface/movies_list_data_source.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/mainLayout/home/repositories_interface/repository_interface.dart';

class MoviesListRepositoryImpl implements MoviesRepository{
  MoviesListDataSource moviesListDataSource;
  MoviesListRepositoryImpl({required this.moviesListDataSource});
  @override
  Future<Either<String, List<Movie>>> getMoviesList({int page=1,String genre="all",int limit=40}) {
    return moviesListDataSource.getMoviesList(page: page,genre: genre,limit: limit);
  }

}