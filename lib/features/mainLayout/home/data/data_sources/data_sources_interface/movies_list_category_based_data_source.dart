import 'package:dartz/dartz.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';

abstract class MoviesCategoryBasedDataSource{
  Future<Either<String,List<Movie>>> getMoviesBasedOnCategory(String categoryName);
}