import 'package:dartz/dartz.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';

abstract class MoviesListDataSource{
  Future<Either<String,List<Movie>>> getMoviesList({int page=1,String genre="all",int limit=40});
}