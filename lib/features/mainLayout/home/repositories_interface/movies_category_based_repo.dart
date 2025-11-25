import 'package:dartz/dartz.dart';

import '../data/models/movie.dart';

abstract class MoviesCategoryBasedRepo{
  Future<Either<String,List<Movie>>> getMoviesBasedOnCategory(String categoryName);

}