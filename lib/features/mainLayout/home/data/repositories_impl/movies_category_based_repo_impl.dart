import 'package:dartz/dartz.dart';
import 'package:movies/features/mainLayout/home/data/data_sources/data_sources_interface/movies_list_category_based_data_source.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/mainLayout/home/repositories_interface/movies_category_based_repo.dart';

class MoviesCategoryBasedRepoImp implements MoviesCategoryBasedRepo{
  final MoviesCategoryBasedDataSource moviesCategoryBasedDataSource;

  MoviesCategoryBasedRepoImp({required this.moviesCategoryBasedDataSource});
  @override
  Future<Either<String, List<Movie>>> getMoviesBasedOnCategory(String categoryName) {
    return moviesCategoryBasedDataSource.getMoviesBasedOnCategory(categoryName);
  }
}