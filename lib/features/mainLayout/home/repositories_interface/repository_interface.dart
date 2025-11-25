import 'package:dartz/dartz.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';

abstract class MoviesRepository {
  Future<Either<String,List<Movie>>> getMoviesList();
}