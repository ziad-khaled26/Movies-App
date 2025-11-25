import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/mainLayout/home/repositories_interface/movies_category_based_repo.dart';

import '../../data/models/movie.dart';

class MoviesCategoryBasedViewModel extends Cubit<MoviesCategoryBasedState>{
  MoviesCategoryBasedViewModel({required this.moviesCategoryBasedRepo}):super(InitialState());
  final MoviesCategoryBasedRepo moviesCategoryBasedRepo;

  getMoviesBasedOnCategory(String categoryName)async{
    emit(MoviesCategoryBaseLoading());
    var result =await moviesCategoryBasedRepo.getMoviesBasedOnCategory(categoryName);
    result.fold(
            (errorMessage){
          emit(MoviesCategoryBasedError(errorMessage: errorMessage));
        },
            (movies){
          emit(MoviesCategoryBasedSuccess(movies:movies));
        }
    );

  }




}
class MoviesCategoryBasedState{}
class InitialState extends MoviesCategoryBasedState{}
class MoviesCategoryBaseLoading extends MoviesCategoryBasedState {}
class MoviesCategoryBasedError extends MoviesCategoryBasedState {
  final String errorMessage;
  MoviesCategoryBasedError({required this.errorMessage});
}
class MoviesCategoryBasedSuccess extends MoviesCategoryBasedState{
  final List<Movie> movies;
  MoviesCategoryBasedSuccess({required this.movies});
}